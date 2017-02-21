@extends('layouts.app')

@section('content')

<head>

</head>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">Player Data For <span style="color:red">{{$player_data->name}}</span></div>

                <div class="panel-body">


                    <table id="player_info" class="table borderless">
                        <tbody>
                            <tr>
                                <td>Player ID</td> <td>{{$player_data->pid}}</td>
                            </tr>
                            <tr>
                                <td>Names Used</td> <td>{{$player_data->aliases}}</td>
                            </tr>
                        <td>Cash in Hand</td> <td>{{$player_data->cash}}</td>
                        </tr>
                        <tr>
                            <td>Cash in Bank</td> <td>{{$player_data->bankacc}}</td>
                        </tr>
                        <tr>
                            <td>Total Time Played</td> <td>{{$player_data->playtime}}</td>
                        </tr>
                        <tr>
                            <td>Start Date</td> <td>{{$player_data->insert_time}}</td>
                        </tr>
                        <tr>
                            <td>Last Seen on the Server</td> <td>{{$player_data->last_seen}}</td>
                        </tr>
                        </tbody>
                    </table>

                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading"> {{$player_data->name}}'s Vehicles</div>

                <div class="panel-body">
                    <table id="vehicle_info" class="table">
                        <thead>
                            <tr>
                                <th>Vehicle Name</th>
                                <th>Vehicle Status</th>
                                <th>Date Purchased</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($vehicle_data as $vehicle)
                            <tr>
                                <td>{{ $vehicle->classname }}</a></td>
                                <td>{{ $vehicle->alive }}</td>
                                <td>{{ $vehicle->insert_time }}</td>

                            </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Vehicle Name</th>
                                <th>Vehicle Status</th>
                                <th>Date Purchased</th>
                            </tr>
                        </tfoot>
                    </table>


                </div>
            </div>
        </div>
    </div>
</div>

<script>

    jQuery(document).ready(function () {
        jQuery('#vehicle_info').DataTable();
    });
</script>
</script>

@endsection

