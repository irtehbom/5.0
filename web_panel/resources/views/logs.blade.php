@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">Admin Logs</div>



                <div class="panel-body">
                    @foreach ($logs as $log_data)

                    @if($log_data->actionType == 'Compensate')
                    <div class="alert alert-success" role="alert"><strong>{{ $log_data->admin }}</strong> Compensated <strong>{{ $log_data->targetUser }}</strong> Amount:  <strong>${{$log_data->value}}</strong><strong style='float:right'>{{$log_data->created_at}}</strong>
                        <div style='width:100%;margin-top:10px; font-weight:bold'>Reason</div>
                        <div style='width:100%;margin-top:10px;'>{{ $log_data->message}}</div>
                    </div>
                    @endif

                    @if($log_data->actionType == 'Blacklist')
                    <div class="alert alert-danger" role="alert"><strong>{{ $log_data->admin }}</strong> Blacklisted <strong>{{ $log_data->targetUser }}</strong> <strong style='float:right'>{{$log_data->created_at}}</strong>
                        <div style='width:100%;margin-top:10px; font-weight:bold'>Reason</div>
                        <div style='width:100%;margin-top:10px;'>{{ $log_data->message}}</div>
                    </div>

                    @endif

                    @if($log_data->actionType == 'DeleteVehicle')
                    <div class="alert alert-danger" role="alert"><strong>{{ $log_data->admin }}</strong> Deleted <strong>{{ $log_data->targetUser }}'s</strong> <strong>{{ $log_data->value }}'s</strong> <strong style='float:right'>{{$log_data->created_at}}</strong>
                        <div style='width:100%;margin-top:10px; font-weight:bold'>Reason</div>
                        <div style='width:100%;margin-top:10px;'>{{ $log_data->message}}</div>
                    </div>
                    @endif

                    @if($log_data->actionType == 'DeleteHouse')
                    <div class="alert alert-danger" role="alert"><strong>{{ $log_data->admin }}</strong> Deleted <strong>{{ $log_data->targetUser }}'s</strong> House at position <strong>{{ $log_data->value }}</strong> <strong style='float:right'>{{$log_data->created_at}}</strong>
                        <div style='width:100%;margin-top:10px; font-weight:bold'>Reason</div>
                        <div style='width:100%;margin-top:10px;'>{{ $log_data->message}}</div>
                    </div>
                    @endif

                    @if($log_data->actionType == 'WhitelistPolice')
                    <div class="alert alert-info" role="alert"><strong>{{ $log_data->admin }}</strong> changed <strong>{{ $log_data->targetUser }}'s</strong> Police whitelist level to <strong>{{ $log_data->value }}</strong> <strong style='float:right'>{{$log_data->created_at}}</strong>

                    </div>
                    @endif

                    @if($log_data->actionType == 'WhitelistMedic')
                    <div class="alert alert-warning" role="alert"><strong>{{ $log_data->admin }}</strong> changed <strong>{{ $log_data->targetUser }}'s</strong> Medic whitelist level to <strong>{{ $log_data->value }}</strong> <strong style='float:right'>{{$log_data->created_at}}</strong>

                    </div>
                    @endif

                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
