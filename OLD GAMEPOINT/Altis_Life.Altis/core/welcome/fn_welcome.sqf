createDialog "GP_Welcome";
waitUntil {!isNull (findDisplay 19000)};
waitUntil {isNull (findDisplay 19000)};