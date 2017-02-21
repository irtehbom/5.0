@extends('layouts.app')

@section('content')

<head>

</head>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">Players</div>

                <div class="panel-body">
                    <table id="vehicles">

                        <thead>
                            <tr>
                                <th>Class Name</th>
                                <th>Player ID</th>
                                <th>Vehicle Alive</th>
                                <th>Insertion Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($Vehicles as $vehicle)
                            <tr>
                                <td>{{ $vehicle->classname }}</td>
                                <td>{{ $vehicle->pid }}</td>
                                <td>{{ $vehicle->alive }}</td>
                                <td>{{ $vehicle->insert_time }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Class Name</th>
                                <th>Player ID</th>
                                <th>Vehicle Alive</th>
                                <th>Insertion Date</th>
                            </tr>
                        </tfoot>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    jQuery(document).ready(function () {
        jQuery('#vehicles').DataTable();
    });
</script>

@endsection

