SECTION "SRAM", SRAM

sSaveData::       save_data_struct sSaveData       ; a000
sBackupSaveData:: save_data_struct sBackupSaveData ; abf8

sb7f0:: db ; b7f0

sMagicNumbers:: ds $b ; b7f1

    ds $4

sb800:: ds $c8 ; b800
sb8c8:: ds $c8 ; b8c8
sb990:: ds $c8 ; b990
sba58:: ds $c8 ; ba58
