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
                    <table id="players">

                        <thead>
                            <tr>
                                <th>Names</th>
                                <th>Aliases</th>
                                <th>Player ID</th>
                                <th>Cash in Hand</th>
                                <th>Bank Account</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($Players as $player)
                            <tr>
                                <td>{{ $player->name }}</td>
                                <td>{{ $player->aliases }}</td>
                                <td>{{ $player->pid }}</td>
                                <td>{{ $player->cash }}</td>
                                <td>{{ $player->bankacc }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Names</th>
                                <th>Aliases</th>
                                <th>Player ID</th>
                                <th>Cash in Hand</th>
                                <th>Bank Account</th>
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
        jQuery('#players').DataTable();
    });
</script>

@endsection

