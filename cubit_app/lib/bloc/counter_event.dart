part of "counter_bloc.dart";

sealed class CounterEvent {}

final class CounterIncrementEvent extends CounterEvent {}

final class CounterDecrementEvent extends CounterEvent {}
