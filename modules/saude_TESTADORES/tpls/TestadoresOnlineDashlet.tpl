{* Template do Dashlet de Testadores Online *}
<div class="dashlet-container {if $cssClass}{$cssClass}{/if}">
    <div class="dashlet-header">
        <span class="dashlet-title">{$title}</span>
        <span class="dashlet-actions">
            <a href="index.php?module=saude_TESTADORES&action=DetailView" class="dashlet-action">Ver todos</a>
        </span>
    </div>
    
    <div class="dashlet-content">
        {if $testadores|@count > 0}
            <table class="dashlet-table" width="100%">
                <thead>
                    <tr>
                        <th>Usuário</th>
                        {if $show_email}<th>E-mail</th>{/if}
                        <th>Status</th>
                        <th>Tempo Online</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$testadores item=testador}
                    <tr>
                        <td>{$testador.usuario_nome|escape}</td>
                        {if $show_email}
                        <td>{$testador.usuario_email|escape}</td>
                        {/if}
                        <td>
                            <span class="status-badge online">Online</span>
                        </td>
                        <td>
                            {math equation="floor(x/3600)" x=$testador.segundos_online format="%02d"}:
                            {math equation="floor((x%3600)/60)" x=$testador.segundos_online format="%02d"}:
                            {math equation="x%60" x=$testador.segundos_online format="%02d"}
                        </td>
                    </tr>
                    {/foreach}
                </tbody>
            </table>
        {else}
            <div class="dashlet-empty">
                Nenhum testador online no momento
            </div>
        {/if}
    </div>
    
    <div class="dashlet-footer">
        <small>Atualizado em: {$smarty.now|date_format:"%H:%M:%S"}</small>
    </div>
</div>

<script>
(function() {
    var refreshInterval = {$refresh_interval} * 1000;
    
    function atualizarTestadores() {
        fetch('api/v1/testadores/status')
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    // Atualiza o dashlet com dados em tempo real
                    console.log('Testadores atualizados:', data);
                }
            })
            .catch(error => {
                console.error('Erro ao atualizar testadores:', error);
            });
    }
    
    // Executa imediatamente
    atualizarTestadores();
    
    // Executa periodicamente
    setInterval(atualizarTestadores, refreshInterval);
})();
</script>