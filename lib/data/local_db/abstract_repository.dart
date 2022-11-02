import 'package:application_patient/data/local_db/models/config_model.dart';
import 'package:application_patient/data/local_db/models/dose_model.dart';
import 'package:application_patient/data/local_db/models/event_model.dart';
import 'package:application_patient/data/local_db/models/pratice_model.dart';

abstract class IrepositoryWater {
  Future<int> insertDose(Dose dose);
  Future<List<Dose>> fetchbydate();
  Future<List<Dose>> fetchall();
  Future<void> updateDose(Dose dose);
  Future<int> deleteDose(Dose dose);
}

abstract class IrepositoryEvent {
  Future<int> insertEvent(Event event);
  Future<List<Event>> fetchbydate();
  Future<List<Event>> fetchall();
  Future<int> deleteDose(Event event);
}

abstract class IrepositoryConfig {
  Future<int> insertconfig(ConfigModel model);
  Future<ConfigModel> fetchmodel();
  Future<void> updateConfig(ConfigModel model);
  Future<int> delete(int id);
}

abstract class IrepositoryPractise {
  Future<int> insertpractise(Practise practise);
  Future<List<Practise>> fetchall();
  Future<int> delete(Practise pratise);
}
