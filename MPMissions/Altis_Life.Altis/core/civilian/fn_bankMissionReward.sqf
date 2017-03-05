// =========================================================================================================
//  Author: Rob
// =========================================================================================================
#include "..\..\script_macros.hpp"

_killer = _this select 0;

hint "You've killed the informer and been credited 100k into your bank account!";

BANK = BANK + 200000;