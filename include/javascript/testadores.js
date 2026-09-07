/**
 * JavaScript para controle de status de testadores
 * Inclua este arquivo no tema ou no header do SuiteCRM
 */

jQuery(document).ready(function($) {
    // Inicialização
    initTestadores();
    
    // Configurações globais
    window.TESTADORES_CONFIG = {
        api_url: 'api/v1/testadores/status',
        refresh_interval: 30000, // 30 segundos
        status_online: 'ONLINE',
        status_offline: 'OFFLINE'
    };
    
    // Carrega status inicial
    loadTestadorStatus();
});

/**
 * Inicializa o módulo de testadores
 */
function initTestadores() {
    // Verifica se o usuário está autenticado
    if (!isUserAuthenticated()) {
        console.log('Usuário não autenticado. Controle de testadores desabilitado.');
        return;
    }
    
    // Adiciona botão de status na navbar
    addStatusButton();
    
    // Inicia atualização periódica
    setInterval(function() {
        loadTestadorStatus();
    }, window.TESTADORES_CONFIG.refresh_interval);
}

/**
 * Verifica se o usuário está autenticado
 */
function isUserAuthenticated() {
    // Verifica se existe ID de usuário na sessão
    return typeof SugarApp !== 'undefined' || 
           typeof current_user_id !== 'undefined' || 
           $('.user-name').length > 0;
}

/**
 * Adiciona botão de status na navbar
 */
function addStatusButton() {
    // Seleciona o container do topo (ajuste conforme necessário)
    var $header = $('header, .navbar, .suite-header, .suite-title-bar');
    
    if ($header.length === 0) {
        $header = $('#wrapper, body');
    }
    
    // Verifica se já existe o botão
    if ($('#testadores-status-btn').length > 0) {
        return;
    }
    
    // Cria o botão
    var $btn = $('<div id="testadores-status-btn" class="btn-group" style="margin-left: 15px; cursor: pointer;">' +
        '<button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' +
        '<i class="fa fa-circle" style="color: #00ff00; margin-right: 5px;"></i> Online' +
        '<span class="caret"></span>' +
        '</button>' +
        '<ul class="dropdown-menu">' +
        '<li><a href="#" onclick="toggleStatus(\'' + window.TESTADORES_CONFIG.status_offline + '\')">Ir para Offline</a></li>' +
        '<li role="separator" class="divider"></li>' +
        '<li><a href="#" onclick="openTestadoresPanel()">Ver testadores</a></li>' +
        '</ul>' +
        '</div>');
    
    // Adiciona ao header
    $header.append($btn);
    
    // Adiciona evento de clique
    $('#testadores-status-btn').on('click', function(e) {
        if (e.target.tagName === 'A') {
            return;
        }
        e.stopPropagation();
    });
}

/**
 * Carrega o status atual do testador
 */
function loadTestadorStatus() {
    $.ajax({
        url: window.TESTADORES_CONFIG.api_url,
        method: 'GET',
        dataType: 'json',
        success: function(response) {
            if (response.status === 'success') {
                updateStatusUI(response.data);
            }
        },
        error: function(xhr, status, error) {
            console.log('Erro ao carregar status de testadores:', error);
        }
    });
}

/**
 * Atualiza a interface com o status atual
 */
function updateStatusUI(data) {
    var $btn = $('#testadores-status-btn');
    
    if (!data) {
        return;
    }
    
    if (data.status === 'ONLINE') {
        $btn.find('button').addClass('btn-success').removeClass('btn-warning');
        $btn.find('.fa-circle').css('color', '#00ff00');
        $btn.find('button span:first-child').html('<i class="fa fa-circle" style="color: #00ff00; margin-right: 5px;"></i> Online');
        $btn.find('li:first-child a').html('Ir para Offline');
    } else {
        $btn.find('button').addClass('btn-warning').removeClass('btn-success');
        $btn.find('.fa-circle').css('color', '#ffaa00');
        $btn.find('button span:first-child').html('<i class="fa fa-circle" style="color: #ffaa00; margin-right: 5px;"></i> Offline');
        $btn.find('li:first-child a').html('Ir para Online');
    }
}

/**
 * Alterna o status do testador
 */
function toggleStatus(novoStatus) {
    $.ajax({
        url: window.TESTADORES_CONFIG.api_url,
        method: 'POST',
        contentType: 'application/json',
        data: JSON.stringify({ status: novoStatus }),
        success: function(response) {
            if (response.status === 'success') {
                loadTestadorStatus();
                showNotification('Status alterado com sucesso!', 'success');
            } else {
                showNotification('Erro ao alterar status: ' + response.message, 'error');
            }
        },
        error: function(xhr, status, error) {
            showNotification('Erro ao alterar status: ' + error, 'error');
        }
    });
}

/**
 * Abre o painel de testadores
 */
function openTestadoresPanel() {
    // Abre em nova aba ou modal (a ser implementado)
    window.open('index.php?module=saude_TESTADORES&action=DetailView', '_blank');
}

/**
 * Exibe notificação
 */
function showNotification(message, type) {
    // Implementação básica - pode ser substituída pela notificação do SuiteCRM
    if (typeof SugarApp !== 'undefined' && SugarApp.showToast) {
        SugarApp.showToast(type, { message: message });
    } else {
        alert(message);
    }
}

/**
 * Formata segundos para HH:MM:SS
 */
function formatTime(seconds) {
    var h = Math.floor(seconds / 3600);
    var m = Math.floor((seconds % 3600) / 60);
    var s = seconds % 60;
    
    return h.toString().padStart(2, '0') + ':' +
           m.toString().padStart(2, '0') + ':' +
           s.toString().padStart(2, '0');
}

/**
 * Adiciona métodos de string
 */
if (!String.prototype.padStart) {
    String.prototype.padStart = function padStart(targetLength, padString) {
        targetLength = targetLength >> 0;
        padString = String(padString || ' ');
        if (this.length >= targetLength) {
            return String(this);
        } else {
            targetLength = targetLength - this.length;
            if (targetLength > padString.length) {
                padString += padString.repeat(targetLength / padString.length);
            }
            return padString.slice(0, targetLength) + String(this);
        }
    };
}