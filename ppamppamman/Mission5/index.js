function Interface(){

  this.implements = function(obj) {
    // this는 인터페이스, obj는 인터페이스를 implements한 클래스
    var notImplementMethod = [];

    for(var method in this) {
      if(method !== 'implements') {
        // obj.__proto__ 객체가 method를 가지고 있지 않으면
        if(!Object.hasOwnProperty.call(obj.__proto__, method)) {
          notImplementMethod.push(method);
        }
      }
    }

    if(notImplementMethod.length > 0) {
      throw new Error(obj.__proto__.constructor.name + " 클래스의 " + notImplementMethod.join() + " 메서드가 구현되지 않았습니다.");
    }
  }
}

// 데이터소스 인터페이스 정의
function DataSource(){
  if (this.constructor === DataSource) { 
    throw new Error(this.constructor.name + ' 인터페이스는 객체를 생성할 수 없습니다.');
  }
  return (function(){
    // 인터페이스 정의 메서드
    var method = {
      readData: function(){},
      writeData: function(data){},
    }
    // 인터페이스의 implements 메서드를 method객체에 이식한다.
    Interface.call(method);
    return method;
  })();
}

// DataSource 인터페이스를 구현하는 FileDataSource 클래스 정의
function FileDataSource(file) {
  this.file = file;
  this.data;
  DataSource().implements(this);
}

FileDataSource.prototype.readData = function() {
  console.log("'" + this.file+ "'에서 데이터를 읽어들인다.")
  return this.data
}

FileDataSource.prototype.writeData = function(data) {
  console.log("'" + this.file+ "'에 데이터를 저장한다.")
  this.data = data
}

// DataSource 인터페이스를 구현하는 FileDataSourceDecorator 클래스 정의
function DataSourceDecorator(datasource){
  DataSource().implements(this);
  this.wrappee = datasource;
}

DataSourceDecorator.prototype.readData = function() {
  return this.wrappee.readData();
}

DataSourceDecorator.prototype.writeData = function(data) {
  this.wrappee.writeData(data);
}

// 부모 생성자를 호출하고 부모의 생성자의 prototype을 super변수에 할당
DataSourceDecorator.prototype.super = function() {
  var $s = this.__proto__.__proto__.constructor;
  $s.apply(this, arguments);
  this.super = $s.prototype;
}

// DataSourceDecorator 클래스를 상속하여 
// EncryptionDecorator 클래스 정의
function EncryptionDecorator(datasource){
  this.super(datasource);
}

EncryptionDecorator.prototype = Object.create(DataSourceDecorator.prototype);
EncryptionDecorator.prototype.constructor = EncryptionDecorator;

EncryptionDecorator.prototype.readData = function() {
    var data = this.super.readData.call(this);
    return this.decode(data);
}

EncryptionDecorator.prototype.writeData = function(data) {
  console.log("입력된 data", data);
  this.encode(data);
  this.super.writeData.call(this, data);
}

EncryptionDecorator.prototype.encode = function(data) {
  console.log("--- 데이터를 암호화합니다.");
  return data;
}

EncryptionDecorator.prototype.decode = function(data) {
  console.log("--- 데이터를 복호화합니다.");
  return data;
}

// DataSourceDecorator 클래스를 상속하여 CompressionDecorator 클래스 정의
function CompressionDecorator(datasource){
  this.super(datasource);
}

CompressionDecorator.prototype = Object.create(DataSourceDecorator.prototype);
CompressionDecorator.prototype.constructor = CompressionDecorator;
CompressionDecorator.prototype.readData = function() {
    var data = this.super.readData.call(this);
    return this.decompress(data);
}

CompressionDecorator.prototype.writeData = function(data) {
  this.compress(data);
  this.super.writeData.call(this, data);
}

CompressionDecorator.prototype.compress = function(data) {
  console.log("--- 데이터를 압축합니다.");
  return data;
}

CompressionDecorator.prototype.decompress = function(data) {
  console.log("--- 데이터를 압축복원합니다.");
  return data;
}

// 클라이언크 클래스 정의
function Client(){}

Client.prototype.test = function() {
  var dataSource = new FileDataSource("file.txt");
  dataSource = new EncryptionDecorator(dataSource);
  dataSource = new CompressionDecorator(dataSource);  
  dataSource.writeData("이 내용이 과연 쓰일까?");

  console.log("====== dataSource의 형태 ======= ");
  console.log(dataSource);
  console.log("====== dataSource의 형태 ======= ");
  console.log(dataSource.readData());
}

new Client().test();