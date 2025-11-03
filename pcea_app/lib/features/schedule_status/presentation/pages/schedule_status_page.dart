import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../stores/schedule_status_store.dart';

class ScheduleStatusPage extends StatefulWidget {
  const ScheduleStatusPage({super.key});

  @override
  State<ScheduleStatusPage> createState() => _ScheduleStatusPageState();
}

class _ScheduleStatusPageState extends State<ScheduleStatusPage> {
  final ScheduleStatusStore store = Modular.get<ScheduleStatusStore>();

  @override
  void initState() {
    super.initState();
    store.loadStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (store.isLoading || store.scheduleStatus == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final status = store.scheduleStatus!;
        switch (status.state) {
          case 0:
            return _EmptyAvailabilityState(
              onAdd: () {
                store.setAvailableDates(['03/11', '10/11']);
              },
            );
          case 1:
            return _WaitingScheduleState(
              onSimulateSchedule: store.simulateBeingScheduled,
            );
          case 2:
            return _ScheduledState(days: status.scheduledDays);
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

class _EmptyAvailabilityState extends StatelessWidget {
  final VoidCallback onAdd;

  const _EmptyAvailabilityState({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              size: 80,
              color: Colors.orange,
            ),
            const SizedBox(height: 16),
            const Text(
              'Você ainda não adicionou seus dias disponíveis.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onAdd,
              child: const Text('Adicionar disponibilidade'),
            ),
          ],
        ),
      ),
    );
  }
}

class _WaitingScheduleState extends StatelessWidget {
  final VoidCallback onSimulateSchedule;

  const _WaitingScheduleState({required this.onSimulateSchedule});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Você adicionou seus dias disponíveis.\nAguarde a definição da escala.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onSimulateSchedule,
              child: const Text('Simular ser escalado'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScheduledState extends StatelessWidget {
  final List<String> days;

  const _ScheduledState({required this.days});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Text(
            'Você foi escalado para:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...days.map(
            (day) => Card(
              child: ListTile(
                leading: const Icon(Icons.event, color: Colors.orange),
                title: Text('Dia $day'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
