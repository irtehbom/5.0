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


                    <div class="col-md-6">

                        <table id="player_info" class="table borderless">
                            <tbody>
                                <tr>
                                    <td>Player ID</td> <td>{{$player_data->pid}}</td>
                                </tr>
                                <tr>
                                    <td>Names Used</td> <td>{{$player_data->aliases}}</td>
                                </tr>
                                <tr>
                                    <td>Cash in Hand</td> <td>{{$player_data->cash}}</td>
                                </tr>
                                <tr>
                                    <td>Cash in Bank</td> <td id="cash_in_bank">{{$player_data->bankacc}}</td>
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

                    <div class="col-md-6" class="form-group">

                        <table id="player_info" class="table borderless" >
                            <tbody>
                                <tr>Before compensating or blacklisting, the player needs to be logged out.</tr>
                                <tr>
                                    <td><input type="text" class="form-control" id="compensate" value="" name="compensate" placeholder="Compensation Amount"></td> <td><button id="compensate_button" type="button" class="btn btn-success">Compensate</button></td>
                                </tr>
                                <tr>
                                    <td>Blacklist Player</td> 
                                    @if($player_data->blacklist == 0)
                                    <td><button type="button" id="blacklist_button" class="btn btn-warning" data-player_id="{{$player_data->pid}}" data-player_blacklisted="{{$player_data->blacklist}}" >Blacklist</button></td>
                                    @else
                                    <td><button type="button" id="blacklist_button" class="btn btn-danger" data-player_id="{{$player_data->pid}}" data-player_blacklisted="{{$player_data->blacklist}}" >Remove Blacklist</button></td>
                                    @endif

                                </tr>
                                <tr>
                                    <td>
                                        Medic Whitelist
                                    </td>
                                    <td>
                                        Police Whitelist
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="dropdown">
                                            <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                Level {{$player_data->mediclevel}}
                                                <span class="caret"></span>
                                            </button>
                                            <ul id="dropdown-menu-medic"class="dropdown-menu" aria-labelledby="dropdownMenu">
                                                <li><a href="#" data-value="0">Level 0</a></li>
                                                <li><a href="#" data-value="1">Level 1</a></li>
                                                <li><a href="#" data-value="2">Level 2</a></li>
                                                <li><a href="#" data-value="3">Level 3</a></li>
                                                <li><a href="#" data-value="4">Level 4</a></li>
                                                <li><a href="#" data-value="5">Level 5</a></li>
                                                <li><a href="#" data-value="6">Level 6</a></li>
                                                <li><a href="#" data-value="7">Level 7</a></li>
                                            </ul>
                                        </div>
                                    </td>

                                    <td>
                                        <div class="dropdown">
                                            <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                Level {{$player_data->coplevel}}
                                                <span class="caret"></span>
                                            </button>
                                            <ul id="dropdown-menu-police"class="dropdown-menu" aria-labelledby="dropdownMenu">
                                                <li><a href="#" data-value="0">Level 0</a></li>
                                                <li><a href="#" data-value="1">Level 1</a></li>
                                                <li><a href="#" data-value="2">Level 2</a></li>
                                                <li><a href="#" data-value="3">Level 3</a></li>
                                                <li><a href="#" data-value="4">Level 4</a></li>
                                                <li><a href="#" data-value="5">Level 5</a></li>
                                                <li><a href="#" data-value="6">Level 6</a></li>
                                                <li><a href="#" data-value="7">Level 7</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </div>

                </div>
            </div>

            <div class="panel panel-default">

                <div class="panel-heading"> 
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#vehicles" aria-controls="vehicles" role="tab" data-toggle="tab">Vehicles</a></li>
                        <li role="presentation"><a href="#gang" aria-controls="#gang" role="tab" data-toggle="tab">Gang</a></li>
                        <li role="presentation"><a href="#houses" aria-controls="#houses" role="tab" data-toggle="tab">Houses</a></li>
                        <li role="presentation"><a href="#realestate" aria-controls="#realestate" role="tab" data-toggle="tab">Real Estate</a></li>
                    </ul>     

                    <div class="panel-body">
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade in active" id="vehicles">
                                <table id="vehicle_info" class="table">
                                    <thead>
                                        <tr>
                                            <th>Vehicle Name</th>
                                            <th>Vehicle Status</th>
                                            <th>Date Purchased</th>
                                            <th>Change Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($vehicle_data as $vehicle)
                                        <tr data-vehicle_id="{{$vehicle->id}}" class="delete_vehicle_row">
                                            <td>{{ $vehicle->classname }}</a></td>

                                            <td>
                                                @if($vehicle->alive == 1)
                                                <span style="color:green">Alive</span> 
                                                @else
                                                <span style="color:red">Dead</span> 
                                                @endif
                                            </td>
                                            <td>{{ $vehicle->insert_time }}</td>
                                            <td><button type="button" id="delete_vehicle" class="delete_vehicle btn btn-danger" data-vehicle_id="{{$vehicle->id}}" >Delete Vehicle</button></td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Vehicle Name</th>
                                            <th>Vehicle Status</th>
                                            <th>Date Purchased</th>
                                            <th>Change Status</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>

                            <div role="tabpanel" class="tab-pane fade" id="gang">

                                @if(isset($gang_data->name)) 

                                <table id="gang" class="table borderless">
                                    <tbody>
                                        <tr>
                                            <td>Gang Name</td> <td>{{$gang_data->name}}</td>
                                        </tr>
                                        <tr>
                                            <td>Owner</td>
                                            <td>
                                                @if($gang_data->owner == $player_data->pid)
                                                <span style="color:green">Yes</span> 
                                                @else
                                                <span style="color:red">No</span> 
                                                @endif
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Gang Members</td> <td>{{$gang_data->members}}</td>
                                        </tr>
                                        <tr>
                                            <td>Bank</td> <td>{{$gang_data->bank}}</td>
                                        </tr>
                                        <tr>
                                            <td>Active</td>
                                            <td>
                                                @if($gang_data->active == 1)
                                                <span style="color:green">Yes</span> 
                                                @else
                                                <span style="color:red">No</span> 
                                                @endif
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Creation Date</td> <td>{{$gang_data->insert_time}}</td>
                                        </tr>
                                    </tbody>
                                </table>

                                @else

                                No gangs found

                                @endif

                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="houses">

                                @if(count($house_data) > 0) 

                                <table id="vehicle_info" class="table">
                                    <thead>
                                        <tr>
                                            <th>Position</th>
                                            <th>Garage</th>
                                            <th>Owned</th>
                                            <th>Purchased Date</th>
                                            <th>Change Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($house_data as $house)
                                        <tr data-house_id="{{$house->id}}" class="delete_house_row">
                                            <td>{{ $house->pos }}</a></td>
                                            <td>
                                                @if($gang_data->active == 1)
                                                <span style="color:green">Yes</span> 
                                                @else
                                                <span style="color:red">No</span> 
                                                @endif
                                            </td>
                                            <td>
                                                @if($house->owned == 1)
                                                <span style="color:green">Yes</span> 
                                                @else
                                                <span style="color:red">No</span> 
                                                @endif
                                            </td>
                                            <td>{{ $house->insert_time }}</td>
                                            <td><button type="button" id="delete_house" class="delete_house btn btn-danger" data-house_id="{{$house->id}}" >Delete House</button></td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Position</th>
                                            <th>Garage</th>
                                            <th>Owned</th>
                                            <th>Purchased Date</th>
                                            <th>Change Status</th>
                                        </tr>
                                    </tfoot>
                                </table>

                                @else

                                No Houses Found

                                @endif

                            </div>
                            <div role="tabpanel" class="tab-pane fade" id="realestate">

                                @if(count($realestate_data) > 0) 

                                <table id="vehicle_info" class="table">
                                    <thead>
                                        <tr>
                                            <th>Position</th>
                                            <th>Virtual Inventory</th>
                                            <th>Containers</th>
                                            <th>Owned</th>
                                            <th>Rent</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($realestate_data as $realestate)
                                        <tr>
                                            <td>{{ $realestate->pos }}</a></td>
                                            <td>{{ $realestate->inventory }}</a></td>
                                            <td>{{ $realestate->containers }}</a></td>
                                            <td>
                                                @if($realestate->owned == 1)
                                                <span style="color:green">Yes</span> 
                                                @else
                                                <span style="color:red">No</span> 
                                                @endif
                                            </td>
                                            <td>{{ $realestate->rent }}</a></td>
                                        </tr>
                                        @endforeach
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Position</th>
                                            <th>Inventory</th>
                                            <th>Containers</th>
                                            <th>Owned</th>
                                            <th>Rent</th>
                                        </tr>
                                    </tfoot>
                                </table>

                                @else

                                No Real Estate Found

                                @endif

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>

        jQuery(document).ready(function () {

            jQuery('#vehicle_info').DataTable();

            $(".dropdown-menu li a").click(function () {
                $(this).parents(".dropdown").find('.btn').html($(this).text() + ' <span class="caret"></span>');
                $(this).parents(".dropdown").find('.btn').val($(this).data('value'));
            });



            $('#myTabs a').click(function (e) {
                e.preventDefault()
                $(this).tab('show')
            });

            $('#compensate_button').click(function () {

                var input_compensate = $('#compensate').val();

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });

                $.ajax({
                    type: "POST",
                    url: '{{ Request::url() }}/compensate',
                    data: {player_id: '{{$player_data->pid}}', compensation_amount: input_compensate},
                    success: function (data) {
                        $('#cash_in_bank').text(data).addClass("flash");
                        setTimeout(function () {
                            $('#cash_in_bank').removeClass('flash');
                        }, 3000);
                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }

                });
            });

            $('#blacklist_button').click(function () {

                var blacklist_value = $('#blacklist_button').data("player_blacklisted");

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });

                $.ajax({
                    type: "POST",
                    url: '{{ Request::url() }}/blacklist',
                    data: {player_id: '{{$player_data->pid}}', blacklist_value: blacklist_value},
                    success: function (data) {

                        if (data == 1) {
                            $('#blacklist_button').text('Remove Blacklist').removeClass("btn-warning").addClass("btn-danger");
                        } else {
                            $('#blacklist_button').text('Blacklist').removeClass("btn-danger").addClass("btn-warning");
                        }

                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }

                });
            });

            $('.delete_vehicle').click(function (e) {
                var vehicle_id = $(this).data("vehicle_id");

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });

                $.ajax({
                    type: "POST",
                    url: '{{ Request::url() }}/delete_vehicle',
                    data: {vehicle_id: vehicle_id},
                    success: function (data) {

                        var $div = $(".delete_vehicle_row").filter(function () {
                            return $(this).data("vehicle_id") == data; // where value == product id to find
                        });
                        $div.remove();

                        $.notifyBar({cssClass: "success", html: "Vehicle Deleted Successfully"});


                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            });

            $('.delete_house').click(function (e) {
                var house_id = $(this).data("house_id");

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });

                $.ajax({
                    type: "POST",
                    url: '{{ Request::url() }}/delete_house',
                    data: {house_id: house_id},
                    success: function (data) {

                        var $div = $(".delete_house_row").filter(function () {
                            return $(this).data("house_id") == data; // where value == product id to find
                        });
                        $div.remove();

                        $.notifyBar({cssClass: "success", html: "House Deleted Successfully"});


                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });
            });

            $("#dropdown-menu-police li a").click(function () {


                var level_selected = $(this).data("value");

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });

                $.ajax({
                    type: "POST",
                    url: '{{ Request::url() }}/whitelist_police',
                    data: {player_id: '{{$player_data->pid}}',level_selected: level_selected},
                    success: function (data) {

                        console.log(data);

                        $.notifyBar({cssClass: "success", html: "Police Level Updated"});


                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });

            });
            
             $("#dropdown-menu-medic li a").click(function () {


                var level_selected = $(this).data("value");

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });

                $.ajax({
                    type: "POST",
                    url: '{{ Request::url() }}/whitelist_medic',
                    data: {player_id: '{{$player_data->pid}}',level_selected: level_selected},
                    success: function (data) {

                        console.log(data);

                        $.notifyBar({cssClass: "success", html: "Medic Level Updated"});


                    },
                    error: function (data) {
                        console.log('Error:', data);
                    }
                });

            });



        });
    </script>

    @endsection

