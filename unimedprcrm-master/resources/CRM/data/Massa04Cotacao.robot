*** Settings ***
Resource    ../../../main.resource

*** Variables ***
@{COTPOTENCIALPF43}         @{OPOPOTENCIALPF24}             #cenario1
@{COTPOTENCIALPF44}         @{OPOPOTENCIALPF24}             #cenario2
@{COTPOTENCIALPF45}         @{OPOPOTENCIALPF24}             #cenario3
@{COTPOTENCIALPF46}         @{OPOPOTENCIALPF24}             #cenario4
@{COTPOTENCIALPF47}         @{OPOPOTENCIALPF24}             #cenario5
@{COTPOTENCIALPF48}         @{OPOPOTENCIALPF24}             #cenario6
@{COTPOTENCIALPF49}         @{OPOPOTENCIALPF24}             #cenario7
@{COTPOTENCIALPF50}         @{OPOPOTENCIALPF24}             #cenario8
@{COTPOTENCIALPF51}         @{OPOPOTENCIALPF24}             #cenario9
@{COTPOTENCIALPF52}         @{OPOPOTENCIALPF22}             #cenario10
@{COTPOTENCIALPF53}         @{OPOPOTENCIALPF22}             #cenario11
@{COTPOTENCIALPF54}         @{OPOPOTENCIALPF22}             #cenario12
@{COTPOTENCIALPF55}         @{OPOPOTENCIALPF22}             #cenario13
@{COTPOTENCIALPF56}         @{OPOPOTENCIALPF22}             #cenario14
@{COTPOTENCIALPF57}         @{OPOPOTENCIALPF22}             #cenario15
@{COTPOTENCIALPF58}         @{OPOPOTENCIALPF22}             #cenario16
@{COTPOTENCIALPF59}         @{OPOPOTENCIALPF22}             #cenario17
@{COTPOTENCIALPF60}         @{OPOPOTENCIALPF22}             #cenario18
@{COTPOTENCIALPF61}                                         #cenario19
@{COTPOTENCIALPF62}                                         #cenario20
@{COTPOTENCIALPF63}                                         #cenario21
@{COTPOTENCIALPJ64}         @{OPOPOTENCIALPJ33}             #cenario22
@{COTPOTENCIALPJ65}         @{OPOPOTENCIALPJ33}             #cenario23
@{COTPOTENCIALPJ66}         @{OPOPOTENCIALPJ33}             #cenario24
@{COTPOTENCIALPJ67}         @{OPOPOTENCIALPJ33}             #cenario25
@{COTPOTENCIALPJ68}         @{OPOPOTENCIALPJ33}             #cenario26
@{COTPOTENCIALPJ69}         @{OPOPOTENCIALPJ33}             #cenario27
@{COTPOTENCIALPJ70}         @{OPOPOTENCIALPJ33}             #cenario28
@{COTPOTENCIALPJ71}         @{OPOPOTENCIALPJ33}             #cenario29
@{COTPOTENCIALPJ72}         @{OPOPOTENCIALPJ33}             #cenario30
@{COTPOTENCIALPJ73}         @{OPOPOTENCIALPJ39}             #cenario31
@{COTPOTENCIALPJ74}         @{OPOPOTENCIALPJ39}             #cenario32
@{COTPOTENCIALPJ75}         @{OPOPOTENCIALPJ39}             #cenario33
@{COTPOTENCIALPJ76}         @{OPOPOTENCIALPJ39}             #cenario34
@{COTPOTENCIALPJ77}         @{OPOPOTENCIALPJ39}             #cenario35
@{COTPOTENCIALPJ78}         @{OPOPOTENCIALPJ39}             #cenario36
@{COTPOTENCIALPJ79}         @{OPOPOTENCIALPJ39}             #cenario37
@{COTPOTENCIALPJ80}         @{OPOPOTENCIALPJ39}             #cenario38
@{COTPOTENCIALPJ81}         @{OPOPOTENCIALPJ39}             #cenario39
@{COTPOTENCIALPJ82}                                         #cenario40
@{COTPOTENCIALPJ83}                                         #cenario41
@{COTPOTENCIALPJ84}                                         #cenario42
@{COTPOTENCIALPJ85}         @{OPOPOTENCIALPJ27}             #cenario43
@{COTPOTENCIALPJ86}         @{OPOPOTENCIALPJ27}             #cenario44
@{COTPOTENCIALPJ87}         @{OPOPOTENCIALPJ27}             #cenario45
@{COTPOTENCIALPJ88}         @{OPOPOTENCIALPJ39}             #cenario46
@{COTPOTENCIALPJ89}         @{OPOPOTENCIALPJ39}             #cenario47
@{COTPOTENCIALPJ90}         @{OPOPOTENCIALPJ39}             #cenario48
@{COTPOTENCIALPJ91}                                         #cenario49
@{COTPOTENCIALPJ92}                                         #cenario50
@{COTPOTENCIALPJ93}                                         #cenario51
@{COTPOTENCIALPJ94}         @{OPOPOTENCIALPF22}             #cenario52
@{COTPOTENCIALPJ95}         @{OPOPOTENCIALPF22}             #cenario53
@{COTPOTENCIALPJ96}         @{OPOPOTENCIALPF22}             #cenario54
@{COTPOTENCIALPJ97}         @{OPOPOTENCIALPJ39}             #cenario55
@{COTPOTENCIALPJ98}         @{OPOPOTENCIALPJ39}             #cenario56
@{COTPOTENCIALPJ99}         @{OPOPOTENCIALPJ39}             #cenario57
@{COTPOTENCIALPJ100}                                        #cenario58
@{COTPOTENCIALPJ101}                                        #cenario59
@{COTPOTENCIALPJ102}                                        #cenario60
@{COTPOTENCIALCAEPF103}        @{OPOPOTENCIALCAEPF42}       #cenario61
@{COTPOTENCIALCAEPF104}        @{OPOPOTENCIALCAEPF42}       #cenario62
@{COTPOTENCIALCAEPF105}        @{OPOPOTENCIALCAEPF42}       #cenario63
@{COTPOTENCIALCAEPF106}        @{OPOPOTENCIALCAEPF34}       #cenario64
@{COTPOTENCIALCAEPF107}        @{OPOPOTENCIALCAEPF34}       #cenario65
@{COTPOTENCIALCAEPF108}        @{OPOPOTENCIALCAEPF34}       #cenario66
@{COTPOTENCIALCAEPF109}                                     #cenario67


#FAKES
#@{COTPOTENCIALPF43}         ${OPOPOTENCIALPF24[0]}  ${OPOPOTENCIALPF24[1]}   ${OPOPOTENCIALPF24[2]}  ${OPOPOTENCIALPF24[3]}  ${OPOPOTENCIALPF24[4]}  ${OPOPOTENCIALPF24[5]}  ${OPOPOTENCIALPF24[6]}  ${OPOPOTENCIALPF24[7]}  ${OPOPOTENCIALPF24[8]}  ${OPOPOTENCIALPF24[9]}
#@{COTPOTENCIALPF44}         ${OPOPOTENCIALPF24[0]}  ${OPOPOTENCIALPF24[1]}   ${OPOPOTENCIALPF24[2]}  ${OPOPOTENCIALPF24[3]}  ${OPOPOTENCIALPF24[4]}  ${OPOPOTENCIALPF24[5]}  ${OPOPOTENCIALPF24[6]}  ${OPOPOTENCIALPF24[7]}  ${OPOPOTENCIALPF24[8]}  ${OPOPOTENCIALPF24[9]}
#@{COTPOTENCIALPF45}         ${OPOPOTENCIALPF24[0]}  ${OPOPOTENCIALPF24[1]}   ${OPOPOTENCIALPF24[2]}  ${OPOPOTENCIALPF24[3]}  ${OPOPOTENCIALPF24[4]}  ${OPOPOTENCIALPF24[5]}  ${OPOPOTENCIALPF24[6]}  ${OPOPOTENCIALPF24[7]}  ${OPOPOTENCIALPF24[8]}  ${OPOPOTENCIALPF24[9]}
#@{COTPOTENCIALPF46}         ${OPOPOTENCIALPF24[0]}  ${OPOPOTENCIALPF24[1]}   ${OPOPOTENCIALPF24[2]}  ${OPOPOTENCIALPF24[3]}  ${OPOPOTENCIALPF24[4]}  ${OPOPOTENCIALPF24[5]}  ${OPOPOTENCIALPF24[6]}  ${OPOPOTENCIALPF24[7]}  ${OPOPOTENCIALPF24[8]}  ${OPOPOTENCIALPF24[9]}
#@{COTPOTENCIALPF47}         ${OPOPOTENCIALPF24[0]}  ${OPOPOTENCIALPF24[1]}   ${OPOPOTENCIALPF24[2]}  ${OPOPOTENCIALPF24[3]}  ${OPOPOTENCIALPF24[4]}  ${OPOPOTENCIALPF24[5]}  ${OPOPOTENCIALPF24[6]}  ${OPOPOTENCIALPF24[7]}  ${OPOPOTENCIALPF24[8]}  ${OPOPOTENCIALPF24[9]}
#@{COTPOTENCIALPF48}         ${OPOPOTENCIALPF24[0]}  ${OPOPOTENCIALPF24[1]}   ${OPOPOTENCIALPF24[2]}  ${OPOPOTENCIALPF24[3]}  ${OPOPOTENCIALPF24[4]}  ${OPOPOTENCIALPF24[5]}  ${OPOPOTENCIALPF24[6]}  ${OPOPOTENCIALPF24[7]}  ${OPOPOTENCIALPF24[8]}  ${OPOPOTENCIALPF24[9]}
#@{COTPOTENCIALPF49}         ${OPOPOTENCIALPF24[0]}  ${OPOPOTENCIALPF24[1]}   ${OPOPOTENCIALPF24[2]}  ${OPOPOTENCIALPF24[3]}  ${OPOPOTENCIALPF24[4]}  ${OPOPOTENCIALPF24[5]}  ${OPOPOTENCIALPF24[6]}  ${OPOPOTENCIALPF24[7]}  ${OPOPOTENCIALPF24[8]}  ${OPOPOTENCIALPF24[9]}
#@{COTPOTENCIALPF50}         ${OPOPOTENCIALPF24[0]}  ${OPOPOTENCIALPF24[1]}   ${OPOPOTENCIALPF24[2]}  ${OPOPOTENCIALPF24[3]}  ${OPOPOTENCIALPF24[4]}  ${OPOPOTENCIALPF24[5]}  ${OPOPOTENCIALPF24[6]}  ${OPOPOTENCIALPF24[7]}  ${OPOPOTENCIALPF24[8]}  ${OPOPOTENCIALPF24[9]}
#@{COTPOTENCIALPF51}         ${OPOPOTENCIALPF24[0]}  ${OPOPOTENCIALPF24[1]}   ${OPOPOTENCIALPF24[2]}  ${OPOPOTENCIALPF24[3]}  ${OPOPOTENCIALPF24[4]}  ${OPOPOTENCIALPF24[5]}  ${OPOPOTENCIALPF24[6]}  ${OPOPOTENCIALPF24[7]}  ${OPOPOTENCIALPF24[8]}  ${OPOPOTENCIALPF24[9]}
#@{COTPOTENCIALPF52}         ${OPOPOTENCIALPF22[0]}  ${OPOPOTENCIALPF22[1]}   ${OPOPOTENCIALPF22[2]}  ${OPOPOTENCIALPF22[3]}  ${OPOPOTENCIALPF22[4]}
#@{COTPOTENCIALPF53}         ${OPOPOTENCIALPF22[0]}  ${OPOPOTENCIALPF22[1]}   ${OPOPOTENCIALPF22[2]}  ${OPOPOTENCIALPF22[3]}  ${OPOPOTENCIALPF22[4]}
#@{COTPOTENCIALPF54}         ${OPOPOTENCIALPF22[0]}  ${OPOPOTENCIALPF22[1]}   ${OPOPOTENCIALPF22[2]}  ${OPOPOTENCIALPF22[3]}  ${OPOPOTENCIALPF22[4]}
#@{COTPOTENCIALPF55}         ${OPOPOTENCIALPF22[0]}  ${OPOPOTENCIALPF22[1]}   ${OPOPOTENCIALPF22[2]}  ${OPOPOTENCIALPF22[3]}  ${OPOPOTENCIALPF22[4]}
#@{COTPOTENCIALPF56}         ${OPOPOTENCIALPF22[0]}  ${OPOPOTENCIALPF22[1]}   ${OPOPOTENCIALPF22[2]}  ${OPOPOTENCIALPF22[3]}  ${OPOPOTENCIALPF22[4]}
#@{COTPOTENCIALPF57}         ${OPOPOTENCIALPF22[0]}  ${OPOPOTENCIALPF22[1]}   ${OPOPOTENCIALPF22[2]}  ${OPOPOTENCIALPF22[3]}  ${OPOPOTENCIALPF22[4]}
#@{COTPOTENCIALPF58}         ${OPOPOTENCIALPF22[0]}  ${OPOPOTENCIALPF22[1]}   ${OPOPOTENCIALPF22[2]}  ${OPOPOTENCIALPF22[3]}  ${OPOPOTENCIALPF22[4]}
#@{COTPOTENCIALPF59}         ${OPOPOTENCIALPF22[0]}  ${OPOPOTENCIALPF22[1]}   ${OPOPOTENCIALPF22[2]}  ${OPOPOTENCIALPF22[3]}  ${OPOPOTENCIALPF22[4]}
#@{COTPOTENCIALPF60}         ${OPOPOTENCIALPF22[0]}  ${OPOPOTENCIALPF22[1]}   ${OPOPOTENCIALPF22[2]}  ${OPOPOTENCIALPF22[3]}  ${OPOPOTENCIALPF22[4]}
#@{COTPOTENCIALPF61}
#@{COTPOTENCIALPF62}
#@{COTPOTENCIALPF63}         
#@{COTPOTENCIALPJ64}         ${OPOPOTENCIALPJ33[0]}  ${OPOPOTENCIALPJ33[1]}  ${OPOPOTENCIALPJ33[2]}  ${OPOPOTENCIALPJ33[3]}  ${OPOPOTENCIALPJ33[4]}  ${OPOPOTENCIALPJ33[5]}  ${OPOPOTENCIALPJ33[6]}  ${OPOPOTENCIALPJ33[7]}  ${OPOPOTENCIALPJ33[8]}  ${OPOPOTENCIALPJ33[9]}  ${OPOPOTENCIALPJ33[10]}  ${OPOPOTENCIALPJ33[11]}  ${OPOPOTENCIALPJ33[12]}  ${OPOPOTENCIALPJ33[13]}  ${OPOPOTENCIALPJ33[14]}
#@{COTPOTENCIALPJ65}         ${OPOPOTENCIALPJ33[0]}  ${OPOPOTENCIALPJ33[1]}  ${OPOPOTENCIALPJ33[2]}  ${OPOPOTENCIALPJ33[3]}  ${OPOPOTENCIALPJ33[4]}  ${OPOPOTENCIALPJ33[5]}  ${OPOPOTENCIALPJ33[6]}  ${OPOPOTENCIALPJ33[7]}  ${OPOPOTENCIALPJ33[8]}  ${OPOPOTENCIALPJ33[9]}  ${OPOPOTENCIALPJ33[10]}  ${OPOPOTENCIALPJ33[11]}  ${OPOPOTENCIALPJ33[12]}  ${OPOPOTENCIALPJ33[13]}  ${OPOPOTENCIALPJ33[14]}
#@{COTPOTENCIALPJ66}         ${OPOPOTENCIALPJ33[0]}  ${OPOPOTENCIALPJ33[1]}  ${OPOPOTENCIALPJ33[2]}  ${OPOPOTENCIALPJ33[3]}  ${OPOPOTENCIALPJ33[4]}  ${OPOPOTENCIALPJ33[5]}  ${OPOPOTENCIALPJ33[6]}  ${OPOPOTENCIALPJ33[7]}  ${OPOPOTENCIALPJ33[8]}  ${OPOPOTENCIALPJ33[9]}  ${OPOPOTENCIALPJ33[10]}  ${OPOPOTENCIALPJ33[11]}  ${OPOPOTENCIALPJ33[12]}  ${OPOPOTENCIALPJ33[13]}  ${OPOPOTENCIALPJ33[14]}
#@{COTPOTENCIALPJ67}         ${OPOPOTENCIALPJ33[0]}  ${OPOPOTENCIALPJ33[1]}  ${OPOPOTENCIALPJ33[2]}  ${OPOPOTENCIALPJ33[3]}  ${OPOPOTENCIALPJ33[4]}  ${OPOPOTENCIALPJ33[5]}  ${OPOPOTENCIALPJ33[6]}  ${OPOPOTENCIALPJ33[7]}  ${OPOPOTENCIALPJ33[8]}  ${OPOPOTENCIALPJ33[9]}  ${OPOPOTENCIALPJ33[10]}  ${OPOPOTENCIALPJ33[11]}  ${OPOPOTENCIALPJ33[12]}  ${OPOPOTENCIALPJ33[13]}  ${OPOPOTENCIALPJ33[14]}
#@{COTPOTENCIALPJ68}         ${OPOPOTENCIALPJ33[0]}  ${OPOPOTENCIALPJ33[1]}  ${OPOPOTENCIALPJ33[2]}  ${OPOPOTENCIALPJ33[3]}  ${OPOPOTENCIALPJ33[4]}  ${OPOPOTENCIALPJ33[5]}  ${OPOPOTENCIALPJ33[6]}  ${OPOPOTENCIALPJ33[7]}  ${OPOPOTENCIALPJ33[8]}  ${OPOPOTENCIALPJ33[9]}  ${OPOPOTENCIALPJ33[10]}  ${OPOPOTENCIALPJ33[11]}  ${OPOPOTENCIALPJ33[12]}  ${OPOPOTENCIALPJ33[13]}  ${OPOPOTENCIALPJ33[14]}
#@{COTPOTENCIALPJ69}         ${OPOPOTENCIALPJ33[0]}  ${OPOPOTENCIALPJ33[1]}  ${OPOPOTENCIALPJ33[2]}  ${OPOPOTENCIALPJ33[3]}  ${OPOPOTENCIALPJ33[4]}  ${OPOPOTENCIALPJ33[5]}  ${OPOPOTENCIALPJ33[6]}  ${OPOPOTENCIALPJ33[7]}  ${OPOPOTENCIALPJ33[8]}  ${OPOPOTENCIALPJ33[9]}  ${OPOPOTENCIALPJ33[10]}  ${OPOPOTENCIALPJ33[11]}  ${OPOPOTENCIALPJ33[12]}  ${OPOPOTENCIALPJ33[13]}  ${OPOPOTENCIALPJ33[14]}
#@{COTPOTENCIALPJ70}         ${OPOPOTENCIALPJ33[0]}  ${OPOPOTENCIALPJ33[1]}  ${OPOPOTENCIALPJ33[2]}  ${OPOPOTENCIALPJ33[3]}  ${OPOPOTENCIALPJ33[4]}  ${OPOPOTENCIALPJ33[5]}  ${OPOPOTENCIALPJ33[6]}  ${OPOPOTENCIALPJ33[7]}  ${OPOPOTENCIALPJ33[8]}  ${OPOPOTENCIALPJ33[9]}  ${OPOPOTENCIALPJ33[10]}  ${OPOPOTENCIALPJ33[11]}  ${OPOPOTENCIALPJ33[12]}  ${OPOPOTENCIALPJ33[13]}  ${OPOPOTENCIALPJ33[14]}
#@{COTPOTENCIALPJ71}         ${OPOPOTENCIALPJ33[0]}  ${OPOPOTENCIALPJ33[1]}  ${OPOPOTENCIALPJ33[2]}  ${OPOPOTENCIALPJ33[3]}  ${OPOPOTENCIALPJ33[4]}  ${OPOPOTENCIALPJ33[5]}  ${OPOPOTENCIALPJ33[6]}  ${OPOPOTENCIALPJ33[7]}  ${OPOPOTENCIALPJ33[8]}  ${OPOPOTENCIALPJ33[9]}  ${OPOPOTENCIALPJ33[10]}  ${OPOPOTENCIALPJ33[11]}  ${OPOPOTENCIALPJ33[12]}  ${OPOPOTENCIALPJ33[13]}  ${OPOPOTENCIALPJ33[14]}
#@{COTPOTENCIALPJ72}         ${OPOPOTENCIALPJ33[0]}  ${OPOPOTENCIALPJ33[1]}  ${OPOPOTENCIALPJ33[2]}  ${OPOPOTENCIALPJ33[3]}  ${OPOPOTENCIALPJ33[4]}  ${OPOPOTENCIALPJ33[5]}  ${OPOPOTENCIALPJ33[6]}  ${OPOPOTENCIALPJ33[7]}  ${OPOPOTENCIALPJ33[8]}  ${OPOPOTENCIALPJ33[9]}  ${OPOPOTENCIALPJ33[10]}  ${OPOPOTENCIALPJ33[11]}  ${OPOPOTENCIALPJ33[12]}  ${OPOPOTENCIALPJ33[13]}  ${OPOPOTENCIALPJ33[14]}
#@{COTPOTENCIALPJ73}         ${OPOPOTENCIALPJ39[0]}  ${OPOPOTENCIALPJ39[1]}   ${OPOPOTENCIALPJ39[2]}  ${OPOPOTENCIALPJ39[3]}  ${OPOPOTENCIALPJ39[4]}
#@{COTPOTENCIALPJ74}         ${OPOPOTENCIALPJ39[0]}  ${OPOPOTENCIALPJ39[1]}   ${OPOPOTENCIALPJ39[2]}  ${OPOPOTENCIALPJ39[3]}  ${OPOPOTENCIALPJ39[4]}
#@{COTPOTENCIALPJ75}         ${OPOPOTENCIALPJ39[0]}  ${OPOPOTENCIALPJ39[1]}   ${OPOPOTENCIALPJ39[2]}  ${OPOPOTENCIALPJ39[3]}  ${OPOPOTENCIALPJ39[4]}
#@{COTPOTENCIALPJ76}         ${OPOPOTENCIALPJ39[0]}  ${OPOPOTENCIALPJ39[1]}   ${OPOPOTENCIALPJ39[2]}  ${OPOPOTENCIALPJ39[3]}  ${OPOPOTENCIALPJ39[4]}
#@{COTPOTENCIALPJ77}         ${OPOPOTENCIALPJ39[0]}  ${OPOPOTENCIALPJ39[1]}   ${OPOPOTENCIALPJ39[2]}  ${OPOPOTENCIALPJ39[3]}  ${OPOPOTENCIALPJ39[4]}
#@{COTPOTENCIALPJ78}         ${OPOPOTENCIALPJ39[0]}  ${OPOPOTENCIALPJ39[1]}   ${OPOPOTENCIALPJ39[2]}  ${OPOPOTENCIALPJ39[3]}  ${OPOPOTENCIALPJ39[4]}
#@{COTPOTENCIALPJ79}         ${OPOPOTENCIALPJ39[0]}  ${OPOPOTENCIALPJ39[1]}   ${OPOPOTENCIALPJ39[2]}  ${OPOPOTENCIALPJ39[3]}  ${OPOPOTENCIALPJ39[4]}
#@{COTPOTENCIALPJ80}         ${OPOPOTENCIALPJ39[0]}  ${OPOPOTENCIALPJ39[1]}   ${OPOPOTENCIALPJ39[2]}  ${OPOPOTENCIALPJ39[3]}  ${OPOPOTENCIALPJ39[4]}
#@{COTPOTENCIALPJ81}         ${OPOPOTENCIALPJ39[0]}  ${OPOPOTENCIALPJ39[1]}   ${OPOPOTENCIALPJ39[2]}  ${OPOPOTENCIALPJ39[3]}  ${OPOPOTENCIALPJ39[4]}
#@{COTPOTENCIALPJ82} 
#@{COTPOTENCIALPJ83}
#@{COTPOTENCIALPJ84}
#@{COTPOTENCIALPJ85}         ${OPOPOTENCIALPF22[0]}  ${OPOPOTENCIALPF22[1]}  ${OPOPOTENCIALPF22[2]}  ${OPOPOTENCIALPF22[3]}  ${OPOPOTENCIALPF22[4]}  ${OPOPOTENCIALPF22[5]}  ${OPOPOTENCIALPF22[6]}  ${OPOPOTENCIALPF22[7]}  ${OPOPOTENCIALPF22[8]}  ${OPOPOTENCIALPF22[9]}  ${OPOPOTENCIALPF22[10]}  ${OPOPOTENCIALPF22[11]}  ${OPOPOTENCIALPF22[12]}  ${OPOPOTENCIALPF22[13]}  ${OPOPOTENCIALPF22[14]}
#@{COTPOTENCIALPJ86}         ${OPOPOTENCIALPF22[0]}  ${OPOPOTENCIALPF22[1]}  ${OPOPOTENCIALPF22[2]}  ${OPOPOTENCIALPF22[3]}  ${OPOPOTENCIALPF22[4]}  ${OPOPOTENCIALPF22[5]}  ${OPOPOTENCIALPF22[6]}  ${OPOPOTENCIALPF22[7]}  ${OPOPOTENCIALPF22[8]}  ${OPOPOTENCIALPF22[9]}  ${OPOPOTENCIALPF22[10]}  ${OPOPOTENCIALPF22[11]}  ${OPOPOTENCIALPF22[12]}  ${OPOPOTENCIALPF22[13]}  ${OPOPOTENCIALPF22[14]}
#@{COTPOTENCIALPJ87}         ${OPOPOTENCIALPF22[0]}  ${OPOPOTENCIALPF22[1]}  ${OPOPOTENCIALPF22[2]}  ${OPOPOTENCIALPF22[3]}  ${OPOPOTENCIALPF22[4]}  ${OPOPOTENCIALPF22[5]}  ${OPOPOTENCIALPF22[6]}  ${OPOPOTENCIALPF22[7]}  ${OPOPOTENCIALPF22[8]}  ${OPOPOTENCIALPF22[9]}  ${OPOPOTENCIALPF22[10]}  ${OPOPOTENCIALPF22[11]}  ${OPOPOTENCIALPF22[12]}  ${OPOPOTENCIALPF22[13]}  ${OPOPOTENCIALPF22[14]}
#@{COTPOTENCIALPJ88}         ${OPOPOTENCIALPJ39[0]}  ${OPOPOTENCIALPJ39[1]}   ${OPOPOTENCIALPJ39[2]}  ${OPOPOTENCIALPJ39[3]}  ${OPOPOTENCIALPJ39[4]}
#@{COTPOTENCIALPJ89}         ${OPOPOTENCIALPJ39[0]}  ${OPOPOTENCIALPJ39[1]}   ${OPOPOTENCIALPJ39[2]}  ${OPOPOTENCIALPJ39[3]}  ${OPOPOTENCIALPJ39[4]}
#@{COTPOTENCIALPJ90}         ${OPOPOTENCIALPJ39[0]}  ${OPOPOTENCIALPJ39[1]}   ${OPOPOTENCIALPJ39[2]}  ${OPOPOTENCIALPJ39[3]}  ${OPOPOTENCIALPJ39[4]}
#@{COTPOTENCIALPJ91}         
#@{COTPOTENCIALPJ92}
#@{COTPOTENCIALPJ93}
#@{COTPOTENCIALPJ94}         ${OPOPOTENCIALPF22[0]}  ${OPOPOTENCIALPF22[1]}  ${OPOPOTENCIALPF22[2]}  ${OPOPOTENCIALPF22[3]}  ${OPOPOTENCIALPF22[4]}  ${OPOPOTENCIALPF22[5]}  ${OPOPOTENCIALPF22[6]}  ${OPOPOTENCIALPF22[7]}  ${OPOPOTENCIALPF22[8]}  ${OPOPOTENCIALPF22[9]}  ${OPOPOTENCIALPF22[10]}  ${OPOPOTENCIALPF22[11]}  ${OPOPOTENCIALPF22[12]}  ${OPOPOTENCIALPF22[13]}  ${OPOPOTENCIALPF22[14]}
#@{COTPOTENCIALPJ95}         ${OPOPOTENCIALPF22[0]}  ${OPOPOTENCIALPF22[1]}  ${OPOPOTENCIALPF22[2]}  ${OPOPOTENCIALPF22[3]}  ${OPOPOTENCIALPF22[4]}  ${OPOPOTENCIALPF22[5]}  ${OPOPOTENCIALPF22[6]}  ${OPOPOTENCIALPF22[7]}  ${OPOPOTENCIALPF22[8]}  ${OPOPOTENCIALPF22[9]}  ${OPOPOTENCIALPF22[10]}  ${OPOPOTENCIALPF22[11]}  ${OPOPOTENCIALPF22[12]}  ${OPOPOTENCIALPF22[13]}  ${OPOPOTENCIALPF22[14]}
#@{COTPOTENCIALPJ96}         ${OPOPOTENCIALPF22[0]}  ${OPOPOTENCIALPF22[1]}  ${OPOPOTENCIALPF22[2]}  ${OPOPOTENCIALPF22[3]}  ${OPOPOTENCIALPF22[4]}  ${OPOPOTENCIALPF22[5]}  ${OPOPOTENCIALPF22[6]}  ${OPOPOTENCIALPF22[7]}  ${OPOPOTENCIALPF22[8]}  ${OPOPOTENCIALPF22[9]}  ${OPOPOTENCIALPF22[10]}  ${OPOPOTENCIALPF22[11]}  ${OPOPOTENCIALPF22[12]}  ${OPOPOTENCIALPF22[13]}  ${OPOPOTENCIALPF22[14]}
#@{COTPOTENCIALPJ97}         ${OPOPOTENCIALPJ39[0]}  ${OPOPOTENCIALPJ39[1]}   ${OPOPOTENCIALPJ39[2]}  ${OPOPOTENCIALPJ39[3]}  ${OPOPOTENCIALPJ39[4]}
#@{COTPOTENCIALPJ98}         ${OPOPOTENCIALPJ39[0]}  ${OPOPOTENCIALPJ39[1]}   ${OPOPOTENCIALPJ39[2]}  ${OPOPOTENCIALPJ39[3]}  ${OPOPOTENCIALPJ39[4]}
#@{COTPOTENCIALPJ99}         ${OPOPOTENCIALPJ39[0]}  ${OPOPOTENCIALPJ39[1]}   ${OPOPOTENCIALPJ39[2]}  ${OPOPOTENCIALPJ39[3]}  ${OPOPOTENCIALPJ39[4]}
#@{COTPOTENCIALPJ100}
#@{COTPOTENCIALPJ101}
#@{COTPOTENCIALPJ102}
#@{COTPOTENCIALCAEPF103}        ${OPOPOTENCIALCAEPF42[0]}  ${OPOPOTENCIALCAEPF42[1]}  ${OPOPOTENCIALCAEPF42[2]}  ${OPOPOTENCIALCAEPF42[3]}  ${OPOPOTENCIALCAEPF42[4]}  ${OPOPOTENCIALCAEPF42[5]}  ${OPOPOTENCIALCAEPF42[6]}  ${OPOPOTENCIALCAEPF42[7]}  ${OPOPOTENCIALCAEPF42[8]}  ${OPOPOTENCIALCAEPF42[9]}  ${OPOPOTENCIALCAEPF42[10]}
#@{COTPOTENCIALCAEPF104}        ${OPOPOTENCIALCAEPF42[0]}  ${OPOPOTENCIALCAEPF42[1]}  ${OPOPOTENCIALCAEPF42[2]}  ${OPOPOTENCIALCAEPF42[3]}  ${OPOPOTENCIALCAEPF42[4]}  ${OPOPOTENCIALCAEPF42[5]}  ${OPOPOTENCIALCAEPF42[6]}  ${OPOPOTENCIALCAEPF42[7]}  ${OPOPOTENCIALCAEPF42[8]}  ${OPOPOTENCIALCAEPF42[9]}  ${OPOPOTENCIALCAEPF42[10]}
#@{COTPOTENCIALCAEPF105}        ${OPOPOTENCIALCAEPF42[0]}  ${OPOPOTENCIALCAEPF42[1]}  ${OPOPOTENCIALCAEPF42[2]}  ${OPOPOTENCIALCAEPF42[3]}  ${OPOPOTENCIALCAEPF42[4]}  ${OPOPOTENCIALCAEPF42[5]}  ${OPOPOTENCIALCAEPF42[6]}  ${OPOPOTENCIALCAEPF42[7]}  ${OPOPOTENCIALCAEPF42[8]}  ${OPOPOTENCIALCAEPF42[9]}  ${OPOPOTENCIALCAEPF42[10]}
#@{COTPOTENCIALCAEPF106}        ${OPOPOTENCIALCAEPF34[0]}  ${OPOPOTENCIALCAEPF34[1]}   ${OPOPOTENCIALCAEPF34[2]}  ${OPOPOTENCIALCAEPF34[3]}  ${OPOPOTENCIALCAEPF34[4]}
#@{COTPOTENCIALCAEPF107}        ${OPOPOTENCIALCAEPF34[0]}  ${OPOPOTENCIALCAEPF34[1]}   ${OPOPOTENCIALCAEPF34[2]}  ${OPOPOTENCIALCAEPF34[3]}  ${OPOPOTENCIALCAEPF34[4]}
#@{COTPOTENCIALCAEPF108}        ${OPOPOTENCIALCAEPF34[0]}  ${OPOPOTENCIALCAEPF34[1]}   ${OPOPOTENCIALCAEPF34[2]}  ${OPOPOTENCIALCAEPF34[3]}  ${OPOPOTENCIALCAEPF34[4]}
#@{COTPOTENCIALCAEPF109}


*** Keywords ***
Instanciar Variaveis Cotacao
    #Instanciar POTENCIAL Cliente PF TR044 
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome"  Arg2:"Nome Conta" Arg3:"CPF" 
    #             Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Celular"
    #             Arg8 Tipo, Arg9 Data Prevista, Arg 10 Origem do Potencial
    # Adicionando: Arg11 Produto Assitencial, Arg 12 Fase Cotação
    Append To List  ${COTPOTENCIALPF44}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF44}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF44}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPF44}

    #Instanciar POTENCIAL Cliente PF TR045
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome"  Arg2:"Nome Conta" Arg3:"CPF" 
    #             Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Celular"
    #             Arg8 Tipo, Arg9 Data Prevista, Arg 10 Origem do Potencial
    # Adicionando: Arg11 Produto Assitencial, Arg 12 Fase Cotação, Arg13 Nome Convênio
    Append To List  ${COTPOTENCIALPF45}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF45}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF45}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPF45}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPF45}  Convênio LEW
    Set Global Variable  @{COTPOTENCIALPF45}  

    #Instanciar POTENCIAL Cliente PF TR046 
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome"  Arg2:"Nome Conta" Arg3:"CPF" 
    #             Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Celular"
    #             Arg8 Tipo, Arg9 Data Prevista, Arg 10 Origem do Potencial
    # Adicionando: Arg11 Produto Assitencial, Arg 12 Fase Cotação, Arg13 Nome Convênio
    Append To List  ${COTPOTENCIALPF46}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF46}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF46}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPF46} 

    #Instanciar POTENCIAL Cliente PF TR047 
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome"  Arg2:"Nome Conta" Arg3:"CPF" 
    #             Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Celular"
    #             Arg8 Tipo, Arg9 Data Prevista, Arg 10 Origem do Potencial
    # Adicionando: Arg11 Produto Assitencial, Arg 12 Fase Cotação, Arg13 Desconto, Arg14 Valor Desconto
    Append To List  ${COTPOTENCIALPF47}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF47}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF47}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPF47}  desconto
    Append To List  ${COTPOTENCIALPF47}  50
    Set Global Variable  @{COTPOTENCIALPF47}

    #Instanciar POTENCIAL Cliente PF TR048 
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome"  Arg2:"Nome Conta" Arg3:"CPF" 
    #             Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Celular"
    #             Arg8 Tipo, Arg9 Data Prevista, Arg 10 Origem do Potencial
    # Adicionando: Arg11 Produto Assitencial, Arg 12 Fase Cotação, Arg13 acrescimo, Arg14 Valor acrescimo
    Append To List  ${COTPOTENCIALPF48}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF48}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF48}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPF48}  acrescimo
    Append To List  ${COTPOTENCIALPF48}  10
    Set Global Variable  @{COTPOTENCIALPF48}

    #Instanciar POTENCIAL Cliente PF TR049 
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome"  Arg2:"Nome Conta" Arg3:"CPF" 
    #             Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Celular"
    #             Arg8 Tipo, Arg9 Data Prevista, Arg 10 Origem do Potencial
    # Adicionando: Arg11 Produto Assitencial, Arg 12 Fase Cotação, Arg13 Nome Convênio, Arg14 Desconto, 
    # Adicionando: Arg15 Valor Desconto
    Append To List  ${COTPOTENCIALPF49}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF49}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF49}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPF49}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPF49}  Convênio LEW
    Append To List  ${COTPOTENCIALPF49}  desconto
    Append To List  ${COTPOTENCIALPF49}  50
    Set Global Variable  @{COTPOTENCIALPF49}  

    #Instanciar POTENCIAL Cliente PF TR050 
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome"  Arg2:"Nome Conta" Arg3:"CPF" 
    #             Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Celular"
    #             Arg8 Tipo, Arg9 Data Prevista, Arg 10 Origem do Potencial
    # Adicionando: Arg11 Produto Assitencial, Arg 12 Fase Cotação, Arg13 Nome Convênio, Arg14 Acrescimo, 
    # Adicionando: Arg15 Valor Acrescimo
    Append To List  ${COTPOTENCIALPF50}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF50}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF50}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPF50}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPF50}  Convênio LEW
    Append To List  ${COTPOTENCIALPF50}  acrescimo
    Append To List  ${COTPOTENCIALPF50}  10
    Set Global Variable  @{COTPOTENCIALPF50}  

    #Instanciar POTENCIAL Cliente PF TR051 
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome"  Arg2:"Nome Conta" Arg3:"CPF" 
    #             Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Celular"
    #             Arg8 Tipo, Arg9 Data Prevista, Arg 10 Origem do Potencial
    # Adicionando: Arg11 Produto Assitencial, Arg 12 Fase Cotação
    Append To List  ${COTPOTENCIALPF51}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF51}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF51}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPF51}  

    #Instanciar Variavel Potencial Cliente PF TR052
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #           Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem do Potencial


    #Instanciar Variavel Potencial Cliente PF TR053
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #           Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação
    Append To List  ${COTPOTENCIALPF53}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF53}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF53}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPF53}  

    #Instanciar Variavel Potencial Cliente PF TR054
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #           Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação, Arg8 Convenio
    Append To List  ${COTPOTENCIALPF54}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF54}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF54}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPF54}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPF54}  Convênio LEW
    Set Global Variable  @{COTPOTENCIALPF54}  

    #Instanciar Variavel Potencial Cliente PF TR055
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #           Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação
    Append To List  ${COTPOTENCIALPF55}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF55}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF55}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPF55}  

    #Instanciar Variavel Potencial Cliente PF TR056
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #           Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação, Arg8 Nome Convênio, Arg9 Desconto, Arg10 Valor Desconto
    Append To List  ${COTPOTENCIALPF56}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF56}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF56}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPF56}  desconto
    Append To List  ${COTPOTENCIALPF56}  50
    Set Global Variable  @{COTPOTENCIALPF56}  

    #Instanciar Variavel Potencial Cliente PF TR057
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #           Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação, Arg8 Nome Convênio, Arg9 Acrescimo, Arg10 Valor Acrescimo
    Append To List  ${COTPOTENCIALPF57}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF57}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF57}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPF57}  acrescimo
    Append To List  ${COTPOTENCIALPF57}  10
    Set Global Variable  @{COTPOTENCIALPF57}  

    #Instanciar POTENCIAL Cliente PF TR058 
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #           Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação, Arg8 Nome Convênio, Arg9 Desconto, 
    # Adicionando: Arg10 Valor Desconto
    Append To List  ${COTPOTENCIALPF58}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF58}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF58}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPF58}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPF58}  Convênio LEW
    Append To List  ${COTPOTENCIALPF58}  desconto
    Append To List  ${COTPOTENCIALPF58}  50
    Set Global Variable  @{COTPOTENCIALPF58}  

    #Instanciar POTENCIAL Cliente PF TR059 
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #           Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação, Arg8 Nome Convênio, Arg9 Acrescimo, 
    # Adicionando: Arg10 Valor Acrescimo
    Append To List  ${COTPOTENCIALPF59}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF59}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF59}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPF59}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPF59}  Convênio LEW
    Append To List  ${COTPOTENCIALPF59}  acrescimo
    Append To List  ${COTPOTENCIALPF59}  10
    Set Global Variable  @{COTPOTENCIALPF59}

    #Instanciar POTENCIAL Cliente PF TR060 
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #           Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação
    Append To List  ${COTPOTENCIALPF60}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF60}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF60}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPF60}

    #Instanciar POTENCIAL Cliente PF TR061 
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #           Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação, Arg8 Nome Convênio, 
    # Adicionando: Arg9 Tipo de Negociacao, Arg10 Valor da Negociacao, Arg11 Tit
    Append To List  ${COTPOTENCIALPF61}  Potencial Cliente (PF)
    ${temp}  FakerLibrary.Name
    ${conta}  Catenate  Conta Potencial  ${temp}
    ${conta}  Convert To Uppercase  ${conta}  
    Append To List  ${COTPOTENCIALPF61}  ${conta}
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${COTPOTENCIALPF61}  ${temp}
    Append To List  ${COTPOTENCIALPF61}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF61}  ${date}
    Append To List  ${COTPOTENCIALPF61}  WhatsApp
    Append To List  ${COTPOTENCIALPF61}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF61}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF61}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPF61}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPF61}  Convênio LEW
    Append To List  ${COTPOTENCIALPF61}  desconto
    Append To List  ${COTPOTENCIALPF61}  50
    ${TIT}  Catenate  TIT  ${COTPOTENCIALPF61[1]}
    Append To List  ${COTPOTENCIALPF61}  ${TIT}
    Set Global Variable  @{COTPOTENCIALPF61}

    #Instanciar POTENCIAL Cliente PF TR062 
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #           Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação, Arg8 Nome Convênio, 
    # Adicionando: Arg9 Tipo de Negociacao, Arg10 Valor da Negociacao, Arg11 Tit
    Append To List  ${COTPOTENCIALPF62}  Potencial Cliente (PF)
    ${temp}  FakerLibrary.Name
    ${conta}  Catenate  Conta Potencial  ${temp}
    ${conta}  Convert To Uppercase  ${conta}  
    Append To List  ${COTPOTENCIALPF62}  ${conta}
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${COTPOTENCIALPF62}  ${temp}
    Append To List  ${COTPOTENCIALPF62}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF62}  ${date}
    Append To List  ${COTPOTENCIALPF62}  WhatsApp
    Append To List  ${COTPOTENCIALPF62}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF62}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF62}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPF62}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPF62}  Convênio LEW
    Append To List  ${COTPOTENCIALPF62}  acrescimo
    Append To List  ${COTPOTENCIALPF62}  10
    ${TIT}  Catenate  TIT  ${COTPOTENCIALPF62[1]}
    Append To List  ${COTPOTENCIALPF62}  ${TIT}
    Set Global Variable  @{COTPOTENCIALPF62}

    #Instanciar POTENCIAL Cliente PF TR063
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #           Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação, Arg8 Nome Convênio, 
    # Adicionando: Arg9 Tipo de Negociacao, Arg10 Valor da Negociacao, Arg11 Tit, Arg12 Tipo Contratacao
    Append To List  ${COTPOTENCIALPF63}  Potencial Cliente (PF)
    ${temp}  FakerLibrary.Name
    ${conta}  Catenate  Conta Potencial  ${temp}
    ${conta}  Convert To Uppercase  ${conta}  
    Append To List  ${COTPOTENCIALPF63}  ${conta}
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${COTPOTENCIALPF63}  ${temp}
    Append To List  ${COTPOTENCIALPF63}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF63}  ${date}
    Append To List  ${COTPOTENCIALPF63}  WhatsApp
    Append To List  ${COTPOTENCIALPF63}  ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${COTPOTENCIALPF63}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF63}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPF63}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPF63}  Convênio LEW
    Append To List  ${COTPOTENCIALPF63}  acrescimo
    Append To List  ${COTPOTENCIALPF63}  10
    ${TIT}  Catenate  TIT  ${COTPOTENCIALPF63[1]}
    Append To List  ${COTPOTENCIALPF63}  ${TIT}
    Append To List  ${COTPOTENCIALPF63}  Individual Familiar
    Set Global Variable  @{COTPOTENCIALPF63}

    #Instanciar Variavel Cliente PJ TR064
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    #            Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    #            Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    #            Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
    # Adicionando: Arg16 Produto Assitencial, Arg 17 Fase Cotação
    Append To List  ${COTPOTENCIALPJ64}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ64}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ64}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPJ64}

    #Instanciar Variavel Cliente PJ TR065
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    #            Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    #            Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    #            Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
    # Adicionando: Arg16 Produto Assitencial, Arg17 Fase Cotação, Arg18 Convenio
    Append To List  ${COTPOTENCIALPJ65}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ65}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ65}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPJ65}

    #Instanciar Variavel Cliente PJ TR066
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    #            Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    #            Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    #            Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
    # Adicionando: Arg16 Produto Assitencial, Arg17 Fase Cotação, Arg18 Convenio
    Append To List  ${COTPOTENCIALPJ66}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ66}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ66}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ66}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ66}  Convênio LEW
    Set Global Variable  @{COTPOTENCIALPJ66}

    #Instanciar Variavel Cliente PJ TR067
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    #            Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    #            Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    #            Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
    # Adicionando: Arg16 Produto Assitencial, Arg17 Fase Cotação, Arg18 Convenio
    Append To List  ${COTPOTENCIALPJ67}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ67}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ67}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPJ67}

    #Instanciar Variavel Cliente PJ TR068
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    #            Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    #            Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    #            Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
    # Adicionando: Arg16 Produto Assitencial, Arg17 Fase Cotação, Arg18 Tipo Negociação, Arg19 Valor Negociação
    Append To List  ${COTPOTENCIALPJ68}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ68}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ68}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ68}  desconto
    Append To List  ${COTPOTENCIALPJ68}  50
    Set Global Variable  @{COTPOTENCIALPJ68}

    #Instanciar Variavel Cliente PJ TR069
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    #            Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    #            Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    #            Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
    # Adicionando: Arg16 Produto Assitencial, Arg17 Fase Cotação, Arg18 Tipo Negociação, Arg19 Valor Negociação
    Append To List  ${COTPOTENCIALPJ69}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ69}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ69}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ69}  acrescimo
    Append To List  ${COTPOTENCIALPJ69}  10
    Set Global Variable  @{COTPOTENCIALPJ69}

    #Instanciar Variavel Cliente PJ TR070
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    #            Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    #            Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    #            Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
    # Adicionando: Arg16 Produto Assitencial, Arg17 Fase Cotação, Arg18 Convenio, Arg19 Tipo Negociação, Arg20 Valor Negociação
    Append To List  ${COTPOTENCIALPJ70}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ70}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ70}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ70}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ70}  Convênio LEW
    Append To List  ${COTPOTENCIALPJ70}  desconto
    Append To List  ${COTPOTENCIALPJ70}  50
    Set Global Variable  @{COTPOTENCIALPJ70}

    #Instanciar Variavel Cliente PJ TR071
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    #            Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    #            Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    #            Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
    # Adicionando: Arg16 Produto Assitencial, Arg17 Fase Cotação, Arg18 Convenio, Arg19 Tipo Negociação, Arg20 Valor Negociação
    Append To List  ${COTPOTENCIALPJ71}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ71}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ71}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ71}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ71}  Convênio LEW
    Append To List  ${COTPOTENCIALPJ71}  acrescimo
    Append To List  ${COTPOTENCIALPJ71}  10
    Set Global Variable  @{COTPOTENCIALPJ71}

    #Instanciar Variavel Cliente PJ TR072
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    #            Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    #            Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    #            Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
    # Adicionando: Arg16 Produto Assitencial, Arg 17 Fase Cotação
    Append To List  ${COTPOTENCIALPJ72}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ72}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ72}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPJ72}

    #Instanciar Variavel Potencial Cliente PJ TR073
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação 
    Append To List  ${COTPOTENCIALPJ73}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ73}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ73}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPJ73}

    #Instanciar Variavel Potencial Cliente PJ TR074
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação 
    Append To List  ${COTPOTENCIALPJ74}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ74}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ74}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPJ74}

    #Instanciar Variavel Potencial Cliente PJ TR075
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação 
    Append To List  ${COTPOTENCIALPJ75}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ75}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ75}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ75}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ75}  Convênio LEW
    Set Global Variable  @{COTPOTENCIALPJ75}

    #Instanciar Variavel Potencial Cliente PJ TR076
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação 
    Append To List  ${COTPOTENCIALPJ76}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ76}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ76}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPJ76}

    #Instanciar Variavel Potencial Cliente PJ TR077
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação, Arg8 Tipo Negociação, Arg9 Valor Negociação
    Append To List  ${COTPOTENCIALPJ77}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ77}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ77}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ77}  desconto
    Append To List  ${COTPOTENCIALPJ77}  50
    Set Global Variable  @{COTPOTENCIALPJ77}

    #Instanciar Variavel Potencial Cliente PJ TR078
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação, Arg8 Tipo Negociação, Arg9 Valor Negociação
    Append To List  ${COTPOTENCIALPJ78}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ78}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ78}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ78}  acrescimo
    Append To List  ${COTPOTENCIALPJ78}  10
    Set Global Variable  @{COTPOTENCIALPJ78}

    #Instanciar Variavel Potencial Cliente PJ TR079
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação, Arg8 Convenio, Arg9 Tipo Negociação, Arg10 Valor Negociação
    Append To List  ${COTPOTENCIALPJ79}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ79}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ79}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ79}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ79}  Convênio LEW
    Append To List  ${COTPOTENCIALPJ79}  desconto
    Append To List  ${COTPOTENCIALPJ79}  50
    Set Global Variable  @{COTPOTENCIALPJ79}

    #Instanciar Variavel Potencial Cliente PJ TR080
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação, Arg8 Convenio, Arg9 Tipo Negociação, Arg10 Valor Negociação
    Append To List  ${COTPOTENCIALPJ80}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ80}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ80}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ80}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ80}  Convênio LEW
    Append To List  ${COTPOTENCIALPJ80}  acrescimo
    Append To List  ${COTPOTENCIALPJ80}  10
    Set Global Variable  @{COTPOTENCIALPJ80}

    #Instanciar Variavel Potencial Cliente PJ TR081
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação, Arg8 Convenio, Arg9 Tipo Negociação, Arg10 Valor Negociação
    Append To List  ${COTPOTENCIALPJ81}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ81}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ81}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPJ81}

    #Instanciar POTENCIAL Cliente PJ TR082
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação, Arg8 Nome Convênio, 
    # Adicionando: Arg9 Tipo de Negociacao, Arg10 Valor da Negociacao, Arg11 Tit
    Append To List  ${COTPOTENCIALPJ82}  Potencial Cliente (PJ)
    ${temp}  FakerLibrary.Company
    ${conta}  Catenate  Conta Potencial  ${temp}
    ${conta}  Convert To Uppercase  ${conta}  
    Append To List  ${COTPOTENCIALPJ82}  ${conta}
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${COTPOTENCIALPJ82}  ${temp}
    Append To List  ${COTPOTENCIALPJ82}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ82}  ${date}
    Append To List  ${COTPOTENCIALPJ82}  WhatsApp
    Append To List  ${COTPOTENCIALPJ82}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    # Append To List  ${COTPOTENCIALPJ82}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ82}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ82}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ82}  Convênio LEW
    Append To List  ${COTPOTENCIALPJ82}  desconto
    Append To List  ${COTPOTENCIALPJ82}  50
    ${TIT}  Catenate  TIT  ${COTPOTENCIALPJ82[1]}
    Append To List  ${COTPOTENCIALPJ82}  ${TIT}
    Set Global Variable  @{COTPOTENCIALPJ82}

    #Instanciar POTENCIAL Cliente PJ TR083
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação, Arg8 Nome Convênio, 
    # Adicionando: Arg9 Tipo de Negociacao, Arg10 Valor da Negociacao, Arg11 Tit
    Append To List  ${COTPOTENCIALPJ83}  Potencial Cliente (PJ)
    ${temp}  FakerLibrary.Company
    ${conta}  Catenate  Conta Potencial  ${temp}
    ${conta}  Convert To Uppercase  ${conta}  
    Append To List  ${COTPOTENCIALPJ83}  ${conta}
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${COTPOTENCIALPJ83}  ${temp}
    Append To List  ${COTPOTENCIALPJ83}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ83}  ${date}
    Append To List  ${COTPOTENCIALPJ83}  WhatsApp
    Append To List  ${COTPOTENCIALPJ83}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    # Append To List  ${COTPOTENCIALPJ83}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ83}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ83}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ83}  Convênio LEW
    Append To List  ${COTPOTENCIALPJ83}  acrescimo
    Append To List  ${COTPOTENCIALPJ83}  10
    ${TIT}  Catenate  TIT  ${COTPOTENCIALPJ83[1]}
    Append To List  ${COTPOTENCIALPJ83}  ${TIT}
    Set Global Variable  @{COTPOTENCIALPJ83}

    #Instanciar POTENCIAL Cliente PJ TR084
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Produto Assitencial, Arg7 Fase Cotação, Arg8 Nome Convênio, 
    # Adicionando: Arg9 Tipo de Negociacao, Arg10 Valor da Negociacao, Arg11 Tit
    Append To List  ${COTPOTENCIALPJ84}  Potencial Cliente (PJ)
    ${temp}  FakerLibrary.Company
    ${conta}  Catenate  Conta Potencial  ${temp}
    ${conta}  Convert To Uppercase  ${conta}  
    Append To List  ${COTPOTENCIALPJ84}  ${conta}
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${COTPOTENCIALPJ84}  ${temp}
    Append To List  ${COTPOTENCIALPJ84}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ84}  ${date}
    Append To List  ${COTPOTENCIALPJ84}  WhatsApp
    Append To List  ${COTPOTENCIALPJ84}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    # Append To List  ${COTPOTENCIALPJ84}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ84}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ84}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ84}  Convênio LEW
    Append To List  ${COTPOTENCIALPJ84}  acrescimo
    Append To List  ${COTPOTENCIALPJ84}  10
    ${TIT}  Catenate  TIT  ${COTPOTENCIALPJ84[1]}
    Append To List  ${COTPOTENCIALPJ84}  ${TIT}
    Set Global Variable  @{COTPOTENCIALPJ84}
    
    #Instanciar Variavel Potencial Cliente PJ TR085
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    #            Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    #            Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    #            Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
    # Adicionando: Arg16 Plano, Arg17 Produto Assitencial, Arg18 Produto Assitencial, Arg 19 Fase Cotação
    Append To List  ${COTPOTENCIALPJ85}   ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ85}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALPJ85}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ85}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ85}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ85}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ85}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPJ85}

    #Instanciar Variavel Potencial Cliente PJ TR086
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    #            Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    #            Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    #            Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
    # Adicionando: Arg16 Plano, Arg17 Convenio, Arg18 Produto Assitencial1, Arg19 Plano Negociacao, Arg20 Valor Negociacao,
    #adicionando:  Arg21 Produto Assitencial2, Arg22 Plano Negociacao1, Arg23 Valor Negociação, Arg24 Fase Cotação
    Append To List  ${COTPOTENCIALPJ86}     ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ86}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALPJ86}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ86}  Convênio LEW
    Append To List  ${COTPOTENCIALPJ86}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ86}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ86}  desconto
    Append To List  ${COTPOTENCIALPJ86}  50
    Append To List  ${COTPOTENCIALPJ86}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ86}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ86}  acrescimo
    Append To List  ${COTPOTENCIALPJ86}  10
    Append To List  ${COTPOTENCIALPJ86}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPJ86}

    #Instanciar Variavel Potencial Cliente PJ TR087
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    #            Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    #            Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    #            Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
    # Adicionando: Arg16 Plano, Arg17 Produto Assitencial, Arg18 Produto Assitencial, Arg19 Fase Cotação
    Append To List  ${COTPOTENCIALPJ87}   ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ87}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALPJ87}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ87}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ87}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ87}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ87}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPJ87}

    #Instanciar Variavel Potencial Cliente PJ TR088
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Plano, Arg7 Produto Assitencial, Arg8 Produto Assitencial, Arg9 Fase Cotação
    Append To List  ${COTPOTENCIALPJ88}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ88}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALPJ88}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ88}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ88}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ88}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ88}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPJ88}

    #Instanciar Variavel Potencial Cliente PJ TR089
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Plano, Arg7 Convenio, Arg8 Produto Assitencial1, Arg9 Plano Negociacao, Arg10 Valor Negociacao,
    #adicionando:  Arg11 Produto Assitencial2, Arg12 Plano Negociacao1, Arg13 Valor Negociação, Arg14 Fase Cotação
    Append To List  ${COTPOTENCIALPJ89}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ89}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALPJ89}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ89}  Convênio LEW
    Append To List  ${COTPOTENCIALPJ89}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ89}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ89}  desconto
    Append To List  ${COTPOTENCIALPJ89}  50
    Append To List  ${COTPOTENCIALPJ89}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ89}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ89}  acrescimo
    Append To List  ${COTPOTENCIALPJ89}  10
    Append To List  ${COTPOTENCIALPJ89}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPJ89}

    #Instanciar Variavel Potencial Cliente PJ TR090
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Plano, Arg7 Convenio, Arg8 Produto Assitencial1, Arg9 Plano Negociacao, Arg10 Valor Negociacao,
    #adicionando:  Arg11 Produto Assitencial2, Arg12 Plano Negociacao1, Arg13 Valor Negociação, Arg14 Fase Cotação
    Append To List  ${COTPOTENCIALPJ90}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ90}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALPJ90}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ90}  Convênio LEW
    Append To List  ${COTPOTENCIALPJ90}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ90}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ90}  desconto
    Append To List  ${COTPOTENCIALPJ90}  50
    Append To List  ${COTPOTENCIALPJ90}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ90}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ90}  acrescimo
    Append To List  ${COTPOTENCIALPJ90}  10
    Append To List  ${COTPOTENCIALPJ90}  Concluído e Aceito
    Set Global Variable  @{COTPOTENCIALPJ90}

    #Instanciar POTENCIAL Cliente PJ TR091
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Fase Cotação, Arg7 Nome Convênio, Arg8 Titulo 
    # Adicionando: Arg9 Plano, Arg10 Produto Assitencial1, Arg11 Tipo de Negociacao1, Arg12 Valor da Negociacao1
    # Adicionando: Arg13 Produto Assistencial2, Arg14 Tipo de Negociacao2, Arg15 Valor da Negociacao2
    Append To List  ${COTPOTENCIALPJ91}  Potencial Cliente (PJ)
    ${temp}  FakerLibrary.Company
    ${conta}  Catenate  Conta Potencial  ${temp}
    ${conta}  Convert To Uppercase  ${conta}  
    Append To List  ${COTPOTENCIALPJ91}  ${conta}
    ${temp}  Evaluate  random.randint(30, 99)
    Append To List  ${COTPOTENCIALPJ91}  ${temp}
    Append To List  ${COTPOTENCIALPJ91}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ91}  ${date}
    Append To List  ${COTPOTENCIALPJ91}  WhatsApp
    Append To List  ${COTPOTENCIALPJ91}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ91}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ91}  Convênio LEW
    ${TIT}  Catenate  TIT  ${COTPOTENCIALPJ91[1]}
    Append To List  ${COTPOTENCIALPJ91}  ${TIT}
    Append To List  ${COTPOTENCIALPJ91}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ91}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALPJ91}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ91}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ91}  desconto
    Append To List  ${COTPOTENCIALPJ91}  50
    Append To List  ${COTPOTENCIALPJ91}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ91}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ91}  acrescimo
    Append To List  ${COTPOTENCIALPJ91}  10
    Set Global Variable  @{COTPOTENCIALPJ91}

    #Instanciar POTENCIAL Cliente PJ TR092
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Fase Cotação, Arg7 Nome Convênio, Arg8 Titulo 
    # Adicionando: Arg9 Plano, Arg10 Produto Assitencial1, Arg11 Tipo de Negociacao1, Arg12 Valor da Negociacao1
    # Adicionando: Arg13 Produto Assistencial2, Arg14 Tipo de Negociacao2, Arg15 Valor da Negociacao2
    Append To List  ${COTPOTENCIALPJ92}  Potencial Cliente (PJ)
    ${temp}  FakerLibrary.Company
    ${conta}  Catenate  Conta Potencial  ${temp}
    ${conta}  Convert To Uppercase  ${conta}  
    Append To List  ${COTPOTENCIALPJ92}  ${conta}
    ${temp}  Evaluate  random.randint(30, 99)
    Append To List  ${COTPOTENCIALPJ92}  ${temp}
    Append To List  ${COTPOTENCIALPJ92}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ92}  ${date}
    Append To List  ${COTPOTENCIALPJ92}  WhatsApp
    Append To List  ${COTPOTENCIALPJ92}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ92}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ92}  Convênio LEW
    ${TIT}  Catenate  TIT  ${COTPOTENCIALPJ92[1]}
    Append To List  ${COTPOTENCIALPJ92}  ${TIT}
    Append To List  ${COTPOTENCIALPJ92}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ92}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALPJ92}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ92}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ92}  desconto
    Append To List  ${COTPOTENCIALPJ92}  50
    Append To List  ${COTPOTENCIALPJ92}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${COTPOTENCIALPJ92}  acrescimo
    Append To List  ${COTPOTENCIALPJ92}  10
    Set Global Variable  @{COTPOTENCIALPJ92}

    #Instanciar POTENCIAL Cliente PJ TR093
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Fase Cotação, Arg7 Nome Convênio, Arg8 Titulo 
    # Adicionando: Arg9 Plano, Arg10 Produto Assitencial1, Arg11 Tipo de Negociacao1, Arg12 Valor da Negociacao1
    # Adicionando: Arg13 Produto Assistencial2, Arg14 Tipo de Negociacao2, Arg15 Valor da Negociacao2
    Append To List  ${COTPOTENCIALPJ93}  Potencial Cliente (PJ)
    ${temp}  FakerLibrary.Company
    ${conta}  Catenate  Conta Potencial  ${temp}
    ${conta}  Convert To Uppercase  ${conta}  
    Append To List  ${COTPOTENCIALPJ93}  ${conta}
    ${temp}  Evaluate  random.randint(30, 99)
    Append To List  ${COTPOTENCIALPJ93}  ${temp}
    Append To List  ${COTPOTENCIALPJ93}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ93}  ${date}
    Append To List  ${COTPOTENCIALPJ93}  WhatsApp
    Append To List  ${COTPOTENCIALPJ93}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ93}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ93}  Convênio LEW
    ${TIT}  Catenate  TIT  ${COTPOTENCIALPJ93[1]}
    Append To List  ${COTPOTENCIALPJ93}  ${TIT}
    Append To List  ${COTPOTENCIALPJ93}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ93}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALPJ93}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ93}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ93}  desconto
    Append To List  ${COTPOTENCIALPJ93}  50
    Append To List  ${COTPOTENCIALPJ93}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ93}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ93}  acrescimo
    Append To List  ${COTPOTENCIALPJ93}  10
    Set Global Variable  @{COTPOTENCIALPJ93}

    #Instanciar Variavel Potencial Cliente PJ TR094
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    # Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    # Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    # Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
    # Adicionando: Arg 16 Fase Cotação, Arg17 Plano1, Arg18 Produto Assitencial1, Arg19 Plano, Arg20 Produto Assitencial2, 
    Append To List  ${COTPOTENCIALPJ94}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ94}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ94}  3018 - Plano 3018
    Append To List  ${COTPOTENCIALPJ94}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ94}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${COTPOTENCIALPJ94}  ${GLOBAL_NAME_PLA_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ94}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALPJ94}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ94}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Set Global Variable  @{COTPOTENCIALPJ94}
    
    #Instanciar Variavel Potencial Cliente PJ TR095
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    # Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    # Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    # Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
    # Adicionando: Arg16 Fase Cotação, Arg17 Convenio
    # Adicionando: Arg18 Plano1, Arg19 Produto Assitencial1, Arg20 Negociacao1, Arg21 Valor Negociacao1
    # Adicionando: Arg22 Plano2, Arg23 Produto Assitencial2, Arg24 Negociacao2, Arg25 Valor Negociacao2
    Append To List  ${COTPOTENCIALPJ95}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ95}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ95}  Convênio LEW
    Append To List  ${COTPOTENCIALPJ95}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ95}  3018 - Plano 3018    
    Append To List  ${COTPOTENCIALPJ95}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ95}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${COTPOTENCIALPJ95}  desconto
    Append To List  ${COTPOTENCIALPJ95}  50
    Append To List  ${COTPOTENCIALPJ95}  ${GLOBAL_NAME_PLA_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ95}  3019 - Plano 3019   
    Append To List  ${COTPOTENCIALPJ95}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ95}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ95}  acrescimo
    Append To List  ${COTPOTENCIALPJ95}  10
    Set Global Variable  @{COTPOTENCIALPJ95}

    #Instanciar Variavel Potencial Cliente PJ TR096
    #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    # Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    # Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    # Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
    # Adicionando: Arg16 Fase Cotação, Arg17 Plano1, Arg18 Produto Assitencial1, Arg19 Plano, Arg20 Produto Assitencial2, 
    Append To List  ${COTPOTENCIALPJ96}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ96}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ96}  3018 - Plano 3018
    Append To List  ${COTPOTENCIALPJ96}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ96}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${COTPOTENCIALPJ96}  ${GLOBAL_NAME_PLA_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ96}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALPJ96}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ96}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Set Global Variable  @{COTPOTENCIALPJ96}

    #Instanciar Variavel Potencial Cliente PJ TR097
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Fase Cotação, Arg7 Plano1, Arg8 Produto Assitencial1, Arg9 Plano, Arg10 Produto Assitencial2, 
    Append To List  ${COTPOTENCIALPJ97}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ97}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ97}  3018 - Plano 3018
    Append To List  ${COTPOTENCIALPJ97}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ97}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${COTPOTENCIALPJ97}  ${GLOBAL_NAME_PLA_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ97}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALPJ97}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ97}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Set Global Variable  @{COTPOTENCIALPJ97}

    #Instanciar Variavel Potencial Cliente PJ TR098
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Fase Cotação, Arg7 Convenio
    # Adicionando: Arg8 Plano1, Arg9 Produto Assitencial1, Arg10 Negociacao1, Arg11 Valor Negociacao1
    # Adicionando: Arg12 Plano2, Arg13 Produto Assitencial2, Arg14 Negociacao2, Arg15 Valor Negociacao2
    Append To List  ${COTPOTENCIALPJ98}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ98}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ98}  Convênio LEW
    Append To List  ${COTPOTENCIALPJ98}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ98}  3018 - Plano 3018    
    Append To List  ${COTPOTENCIALPJ98}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ98}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${COTPOTENCIALPJ98}  desconto
    Append To List  ${COTPOTENCIALPJ98}  50
    Append To List  ${COTPOTENCIALPJ98}  ${GLOBAL_NAME_PLA_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ98}  3019 - Plano 3019   
    Append To List  ${COTPOTENCIALPJ98}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ98}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ98}  acrescimo
    Append To List  ${COTPOTENCIALPJ98}  10
    Set Global Variable  @{COTPOTENCIALPJ98}

    #Instanciar Variavel Potencial Cliente PJ TR099
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Fase Cotação, Arg7 Plano1, Arg8 Produto Assitencial1, Arg9 Plano, Arg10 Produto Assitencial2
    Append To List  ${COTPOTENCIALPJ99}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ99}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ99}  3018 - Plano 3018
    Append To List  ${COTPOTENCIALPJ99}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ99}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${COTPOTENCIALPJ99}  ${GLOBAL_NAME_PLA_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ99}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALPJ99}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ99}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Set Global Variable  @{COTPOTENCIALPJ99}

    #Instanciar POTENCIAL Cliente PJ TR100
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem do Potencial
    # Adicionando: Arg6 Fase Cotação, Arg7 Nome Convênio, Arg8 Titulo 
    # Adicionando: Arg9 Plano1, Arg10 Produto Assitencial1, Arg11 Tipo de Negociacao1, Arg12 Valor da Negociacao1
    # Adicionando: Arg13 Plano2, Arg14 Produto Assistencial2, Arg15 Tipo de Negociacao2, Arg16 Valor da Negociacao2
    Append To List  ${COTPOTENCIALPJ100}  Potencial Cliente (PJ)
    ${temp}  FakerLibrary.Company
    ${conta}  Catenate  Conta Potencial  ${temp}
    ${conta}  Convert To Uppercase  ${conta}  
    Append To List  ${COTPOTENCIALPJ100}  ${conta}
    ${temp}  Evaluate  random.randint(30, 99)
    Append To List  ${COTPOTENCIALPJ100}  ${temp}
    Append To List  ${COTPOTENCIALPJ100}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ100}  ${date}
    Append To List  ${COTPOTENCIALPJ100}  WhatsApp
    Append To List  ${COTPOTENCIALPJ100}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ100}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ100}  Convênio LEW
    ${TIT}  Catenate  TIT  ${COTPOTENCIALPJ91[1]}
    Append To List  ${COTPOTENCIALPJ100}  ${TIT}
    Append To List  ${COTPOTENCIALPJ100}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ100}  3018 - Plano 3018
    Append To List  ${COTPOTENCIALPJ100}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ100}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${COTPOTENCIALPJ100}  desconto
    Append To List  ${COTPOTENCIALPJ100}  50
    Append To List  ${COTPOTENCIALPJ100}  ${GLOBAL_NAME_PLA_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ100}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALPJ100}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ100}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ100}  acrescimo
    Append To List  ${COTPOTENCIALPJ100}  10
    Set Global Variable  @{COTPOTENCIALPJ100}

    #Instanciar POTENCIAL Cliente PJ TR101
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem de Potencial
    # Adicionando: Arg6 Fase Cotação, Arg7 Nome Convênio, Arg8 Titulo 
    # Adicionando: Arg9 Plano, Arg10 Produto Assitencial1, Arg11 Tipo de Negociacao1, Arg12 Valor da Negociacao1
    # Adicionando: Arg13 Produto Assistencial2, Arg14 Tipo de Negociacao2, Arg15 Valor da Negociacao2
    Append To List  ${COTPOTENCIALPJ101}  Potencial Cliente (PJ)
    ${temp}  FakerLibrary.Company
    ${conta}  Catenate  Conta Potencial  ${temp}
    ${conta}  Convert To Uppercase  ${conta}  
    Append To List  ${COTPOTENCIALPJ101}  ${conta}
    ${temp}  Evaluate  random.randint(30, 99)
    Append To List  ${COTPOTENCIALPJ101}  ${temp}
    Append To List  ${COTPOTENCIALPJ101}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ101}  ${date}
    Append To List  ${COTPOTENCIALPJ101}  WhatsApp
    Append To List  ${COTPOTENCIALPJ101}  Concluído e Aceito
    Append To List  ${COTPOTENCIALPJ101}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALPJ101}  Convênio LEW
    ${TIT}  Catenate  TIT  ${COTPOTENCIALPJ101[1]}
    Append To List  ${COTPOTENCIALPJ101}  ${TIT}
    Append To List  ${COTPOTENCIALPJ101}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ101}  3018 - Plano 3018
    Append To List  ${COTPOTENCIALPJ101}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ101}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${COTPOTENCIALPJ101}  acrescimo
    Append To List  ${COTPOTENCIALPJ101}  10
    Append To List  ${COTPOTENCIALPJ101}  ${GLOBAL_NAME_PLA_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ101}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALPJ101}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ101}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ101}  acrescimo
    Append To List  ${COTPOTENCIALPJ101}  10
    Set Global Variable  @{COTPOTENCIALPJ101}

    #Instanciar POTENCIAL Cliente PJ TR102
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem de Potencial
    # Adicionando: Arg6 Fase Cotação, Arg7 Titulo 
    # Adicionando: Arg8 Plano, Arg9 Produto Assitencial1
    # Adicionando: Arg10 Produto Assistencial2, Arg11 Tipo de Negociacao2
    Append To List  ${COTPOTENCIALPJ102}  Potencial Cliente (PJ)
    ${temp}  FakerLibrary.Company
    ${conta}  Catenate  Conta Potencial  ${temp}
    ${conta}  Convert To Uppercase  ${conta}  
    Append To List  ${COTPOTENCIALPJ102}  ${conta}
    ${temp}  Evaluate  random.randint(30, 99)
    Append To List  ${COTPOTENCIALPJ102}  ${temp}
    Append To List  ${COTPOTENCIALPJ102}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ102}  ${date}
    Append To List  ${COTPOTENCIALPJ102}  WhatsApp
    Append To List  ${COTPOTENCIALPJ102}  Concluído e Aceito
    ${TIT}  Catenate  TIT  ${COTPOTENCIALPJ102[1]}
    Append To List  ${COTPOTENCIALPJ102}  ${TIT}
    Append To List  ${COTPOTENCIALPJ102}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ102}  3018 - Plano 3018
    Append To List  ${COTPOTENCIALPJ102}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALPJ102}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${COTPOTENCIALPJ102}  ${GLOBAL_NAME_PLA_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ102}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALPJ102}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALPJ102}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Set Global Variable  @{COTPOTENCIALPJ102}

    #Instanciar Variavel Potencial Cliente CAEPF TR103
    #Argumento Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CAEPF"  
    #          Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    #          Arg8:"Razao Social", Arg9 Tipo, Arg10 Data Prevista, Arg11 Origem de Potencial
    # Adicionando: Arg12 Fase Cotação, Arg13 Plano1, Arg14 Produto Assitencial1
    # Adicionando: Arg15 Plano2, Arg16 Produto Assitencial2
    Append To List  ${COTPOTENCIALCAEPF103}  Concluído e Aceito
    Append To List  ${COTPOTENCIALCAEPF103}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALCAEPF103}  3018 - Plano 3018
    Append To List  ${COTPOTENCIALCAEPF103}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALCAEPF103}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${COTPOTENCIALCAEPF103}  ${GLOBAL_NAME_PLA_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALCAEPF103}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALCAEPF103}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALCAEPF103}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Set Global Variable  @{COTPOTENCIALCAEPF103}

    #Instanciar Variavel Potencial Cliente CAEPF TR104
    #Argumento Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CAEPF"  
    #          Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    #          Arg8:"Razao Social", Arg9 Tipo, Arg10 Data Prevista, Arg11 Origem de Potencial
    # Adicionando: Arg12 Fase Cotação, Arg13 Convenio, Arg14 Plano1, Arg15 Produto Assitencial1, Arg16 T. Negociacao, Arg17 Valor Negociação
    # Adicionando: Arg18 Plano2, Arg19 Produto Assitencial2, Arg20 T. Negociacao, Arg21 Valor Negociação
    Append To List  ${COTPOTENCIALCAEPF104}  Concluído e Aceito
    Append To List  ${COTPOTENCIALCAEPF104}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALCAEPF104}  Convênio LEW
    Append To List  ${COTPOTENCIALCAEPF104}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALCAEPF104}  3018 - Plano 3018
    Append To List  ${COTPOTENCIALCAEPF104}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALCAEPF104}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${COTPOTENCIALCAEPF104}  desconto
    Append To List  ${COTPOTENCIALCAEPF104}  50
    Append To List  ${COTPOTENCIALCAEPF104}  ${GLOBAL_NAME_PLA_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALCAEPF104}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALCAEPF104}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALCAEPF104}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALCAEPF104}  acrescimo
    Append To List  ${COTPOTENCIALCAEPF104}  10
    Set Global Variable  @{COTPOTENCIALCAEPF104}

    #Instanciar Variavel Potencial Cliente CAEPF TR105
    #Argumento Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CAEPF"  
    #          Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    #          Arg8:"Razao Social", Arg9 Tipo, Arg10 Data Prevista, Arg11 Origem de Potencial
    # Adicionando: Arg12 Fase Cotação, Arg13 Plano1, Arg14 Produto Assitencial1
    # Adicionando: Arg15 Plano2, Arg16 Produto Assitencial2
    Append To List  ${COTPOTENCIALCAEPF105}  Concluído e Aceito
    Append To List  ${COTPOTENCIALCAEPF105}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALCAEPF105}  3018 - Plano 3018
    Append To List  ${COTPOTENCIALCAEPF105}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALCAEPF105}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${COTPOTENCIALCAEPF105}  ${GLOBAL_NAME_PLA_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALCAEPF105}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALCAEPF105}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALCAEPF105}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Set Global Variable  @{COTPOTENCIALCAEPF105}

    #Instanciar Variavel Potencial Cliente CAEPF TR106
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem de Potencial
    # Adicionando: Arg6 Fase Cotação, Arg7 Plano1, Arg8 Produto Assitencial1
    # Adicionando: Arg9 Plano2, Arg10 Produto Assitencial2
    Append To List  ${COTPOTENCIALCAEPF106}  Concluído e Aceito
    Append To List  ${COTPOTENCIALCAEPF106}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALCAEPF106}  3018 - Plano 3018
    Append To List  ${COTPOTENCIALCAEPF106}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALCAEPF106}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${COTPOTENCIALCAEPF106}  ${GLOBAL_NAME_PLA_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALCAEPF106}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALCAEPF106}  ${GLOBAL_NAME_PDT_ASSISTENCIAL_2}
    # Append To List  ${COTPOTENCIALCAEPF106}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Set Global Variable  @{COTPOTENCIALCAEPF106}

    #Instanciar Variavel Potencial Cliente CAEPF TR107
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem de Potencial
    # Adicionando: Arg6 Fase Cotação, Arg7 Convenio, Arg8 Plano1, Arg9 Produto Assitencial1, Arg10 T. Negociacao, Arg11 Valor Negociação
    # Adicionando: Arg12 Plano2, Arg13 Produto Assitencial2, Arg14 T. Negociacao, Arg15 Valor Negociação
    Append To List  ${COTPOTENCIALCAEPF107}  Concluído e Aceito
    Append To List  ${COTPOTENCIALCAEPF107}  ${NOME_CONVENIO}
    # Append To List  ${COTPOTENCIALCAEPF107}  Convênio LEW
    Append To List  ${COTPOTENCIALCAEPF107}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALCAEPF107}  3018 - Plano 3018
    Append To List  ${COTPOTENCIALCAEPF107}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALCAEPF107}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${COTPOTENCIALCAEPF107}  desconto
    Append To List  ${COTPOTENCIALCAEPF107}  50
    Append To List  ${COTPOTENCIALCAEPF107}  ${GLOBAL_NAME_PLA_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALCAEPF107}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALCAEPF107}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALCAEPF107}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALCAEPF107}  acrescimo
    Append To List  ${COTPOTENCIALCAEPF107}  10
    Set Global Variable  @{COTPOTENCIALCAEPF107}

    #Instanciar Variavel Potencial Cliente CAEPF TR108
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem de Potencial
    # Adicionando: Arg6 Fase Cotação, Arg7 Plano1, Arg8 Produto Assitencial1
    # Adicionando: Arg9 Plano2, Arg10 Produto Assitencial2
    Append To List  ${COTPOTENCIALCAEPF108}  Concluído e Aceito
    Append To List  ${COTPOTENCIALCAEPF108}  ${GLOBAL_NAME_PLA_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALCAEPF108}  3018 - Plano 3018
    Append To List  ${COTPOTENCIALCAEPF108}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${COTPOTENCIALCAEPF108}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${COTPOTENCIALCAEPF108}  ${GLOBAL_NAME_PLA_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALCAEPF108}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALCAEPF108}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${COTPOTENCIALCAEPF108}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Set Global Variable  @{COTPOTENCIALCAEPF108}

    #Instanciar POTENCIAL Cliente CAEPF TR109
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem de Potencial
    # Adicionando: Arg6 Fase Cotação, Arg7 Titulo 
    # Adicionando: Arg8 Plano, Arg9 Produto Assitencial1
    # Adicionando: Arg10 Produto Assistencial2, Arg11 Tipo de Negociacao2
    Append To List  ${COTPOTENCIALCAEPF109}  Potencial Cliente (CAEPF)
    ${temp}  FakerLibrary.Company
    ${conta}  Catenate  Conta Potencial  ${temp}
    ${conta}  Convert To Uppercase  ${conta}  
    Append To List  ${COTPOTENCIALCAEPF109}  ${conta}
    ${temp}  Evaluate  random.randint(30, 99)
    Append To List  ${COTPOTENCIALCAEPF109}  ${temp}
    Append To List  ${COTPOTENCIALCAEPF109}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALCAEPF109}  ${date}
    Append To List  ${COTPOTENCIALCAEPF109}  WhatsApp
    Append To List  ${COTPOTENCIALCAEPF109}  Concluído e Aceito
    ${TIT}  Catenate  TIT  ${COTPOTENCIALCAEPF109[1]}
    Append To List  ${COTPOTENCIALCAEPF109}  ${TIT}
    Append To List  ${COTPOTENCIALCAEPF109}  ${GLOBAL_NAME_PLA_ADESAO}
    # Append To List  ${COTPOTENCIALCAEPF109}  3018 - Plano 3018
    Append To List  ${COTPOTENCIALCAEPF109}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    # Append To List  ${COTPOTENCIALCAEPF109}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${COTPOTENCIALCAEPF109}  ${GLOBAL_NAME_PLA_ADESAO_2}
    # Append To List  ${COTPOTENCIALCAEPF109}  3019 - Plano 3019
    Append To List  ${COTPOTENCIALCAEPF109}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    # Append To List  ${COTPOTENCIALCAEPF109}  6137 - UNIMED PARTICIPATIVO FLEX - APARTAMENTO
    Set Global Variable  @{COTPOTENCIALCAEPF109}