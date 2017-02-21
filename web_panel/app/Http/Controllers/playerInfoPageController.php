<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class playerInfoPageController extends Controller {

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct() {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $altis_database = \DB::connection('altis_life');
        $params = request()->route()->parameters();

        $player_data = $altis_database->table('players')->where('pid', $params["player_id"])->get();
        $wanted_data = $altis_database->table('wanted')->where('wantedID', $params["player_id"])->get();
        $vehicle_data = $altis_database->table('vehicles')->where('pid', $params["player_id"])->get();
        $gang_data = $altis_database->table('gangs')->where('owner', $params["player_id"])->get();
        $real_estate_data = $altis_database->table('realestate')->where('pid', $params["player_id"])->get();
        $house_data = $altis_database->table('houses')->where('pid', $params["player_id"])->get();

        $player_data = (count($player_data) == 0) ? new \stdClass() : $player_data[0];
        $wanted_data = (count($wanted_data) == 0) ? new \stdClass() : $wanted_data[0];
        $gang_data = (count($gang_data) == 0) ? new \stdClass() : $gang_data[0];

        return view('players_info', [
            "player_data" => $player_data,
            "wanted_data" => $wanted_data,
            "gang_data" => $gang_data,
            "vehicle_data" => $vehicle_data,
            "realestate_data" => $real_estate_data,
            "house_data" => $house_data
                ]
        );
    }

    public function ajax_compensate(Request $request) {

        $altis_database = \DB::connection('altis_life');

        $comp = (int) $request->input('compensation_amount');
        $player_id = $request->input('player_id');

        $player_data = $altis_database->table('players')->where('pid', $player_id)->first();
        $update_bank = $player_data->bankacc + $comp;

        $altis_database->table('players')
                ->where('pid', $player_id)
                ->update(['bankacc' => $update_bank]);

        echo $update_bank;
    }

    public function ajax_blacklist(Request $request) {

        $altis_database = \DB::connection('altis_life');

        $player_id = $request->input('player_id');
        $blacklist_value = $request->input('blacklist_value');

        if ($blacklist_value == 0) {
            $blacklist_value = 1;
        } else {
            $blacklist_value = 0;
        }

        $altis_database->table('players')
                ->where('pid', $player_id)
                ->update(['blacklist' => $blacklist_value]);

        echo $blacklist_value;
    }

    public function ajax_delete_vehicle(Request $request) {

        $altis_database = \DB::connection('altis_life');

        $vehicle_id = $request->input('vehicle_id');

        $altis_database->table('vehicles')
                ->where('id', $vehicle_id)
                ->delete();

        echo $vehicle_id;
    }

    public function ajax_delete_house(Request $request) {

        $altis_database = \DB::connection('altis_life');

        $house_id = $request->input('house_id');

        $altis_database->table('houses')
                ->where('id', $house_id)
                ->delete();

        echo $house_id;
    }

    public function ajax_whitelist_police(Request $request) {

        $altis_database = \DB::connection('altis_life');

        $player_id = $request->input('player_id');
        $level_selected = $request->input('level_selected');

        $altis_database->table('players')
                ->where('pid', $player_id)
                ->update(['coplevel' => $level_selected]);
    }

    public function ajax_whitelist_medic(Request $request) {

        $altis_database = \DB::connection('altis_life');

        $player_id = $request->input('player_id');
        $level_selected = $request->input('level_selected');

        $altis_database->table('players')
                ->where('pid', $player_id)
                ->update(['mediclevel' => $level_selected]);
    }

}
