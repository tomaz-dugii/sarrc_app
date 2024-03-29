import '../database.dart';

class ParticipantsTable extends SupabaseTable<ParticipantsRow> {
  @override
  String get tableName => 'participants_new_1';

  @override
  ParticipantsRow createRow(Map<String, dynamic> data) => ParticipantsRow(data);
}

class ParticipantsRow extends SupabaseDataRow {
  ParticipantsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ParticipantsTable();

  int? get participantID => getField<int>('ParticipantID');
  set participantID(int? value) => setField<int>('ParticipantID', value);

  int get bibID => getField<int>('BibID')!;
  set bibID(int value) => setField<int>('BibID', value);

  String? get lastName => getField<String>('LastName');
  set lastName(String? value) => setField<String>('LastName', value);

  String? get firstName => getField<String>('FirstName');
  set firstName(String? value) => setField<String>('FirstName', value);

  String? get sex => getField<String>('Sex');
  set sex(String? value) => setField<String>('Sex', value);

  String? get city => getField<String>('City');
  set city(String? value) => setField<String>('City', value);

  String? get state => getField<String>('State');
  set state(String? value) => setField<String>('State', value);

  String? get country => getField<String>('Country');
  set country(String? value) => setField<String>('Country', value);

  String? get subEvent => getField<String>('SubEvent');
  set subEvent(String? value) => setField<String>('SubEvent', value);

  int? get age => getField<int>('Age');
  set age(int? value) => setField<int>('Age', value);

  int? get eventID => getField<int>('EventID');
  set eventID(int? value) => setField<int>('EventID', value);

  String? get uuid => getField<String>('uuid');
  set uuid(String? value) => setField<String>('uuid', value);
}

// neki() {
//   return subEventEnum.marathon;
// }

enum SubEventCategory {
  marathon(['PrepdMarathon(SARRCMember)', 'PrepdMarathon']),
  halfMarathon(['PrepdHalfMarathon(SARRCMember)', 'PrepdHalfMarathon']),
  tenK(['Saucony10km(SARRCMember)', 'Saucony10km']),
  fiveK(['Saucony5km(SARRCMember)', 'Saucony5km']);

  final List<String> subEventCategory;
  const SubEventCategory(this.subEventCategory);
}
