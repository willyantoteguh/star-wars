part of 'shared.dart';

class DBHelper {
  static Database _db;
  
  // Create the table columns
  static const String TABLE = 'people';
  static const String NAME = 'name';
  static const String HEIGHT = 'height';
  static const String MASS = 'mass';
  static const String HAIR_COLOR = 'hairColor';
  static const String SKIN_COLOR = 'skinColor';
  static const String EYE_COLOR = 'eyeColor';
  static const String BIRTH_YEAR = 'birthYear';
  static const String GENDER = 'gender';
  static const String HOMEWORLD = 'homeWorld';
  static const String DB_NAME = 'album.db';

  // Initialize the Database
  Future<Database> get db async {
    if (null != _db) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $TABLE ($NAME TEXT, $HEIGHT TEXT, $MASS TEXT, $HAIR_COLOR TEXT, $SKIN_COLOR TEXT, $EYE_COLOR TEXT, $BIRTH_YEAR TEXT, $GENDER TEXT, $HOMEWORLD TEXT)");
  }

  Future<People> save(People people) async {
    var dbClient = await db;
    people.name = (await dbClient.insert(TABLE, people.toJson())) as String;
    return people;
  }

  Future<People> getPeople() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [NAME, HEIGHT, MASS, HAIR_COLOR, SKIN_COLOR, EYE_COLOR, BIRTH_YEAR, GENDER, HOMEWORLD]);
    People allPeople = People();
    List<People> peoples = [];
    if (maps.length > 0){
      for (int i = 0; i < maps.length; i++){
        peoples.add(People.fromJson(maps[i]));
      }
    }
    
  }


}