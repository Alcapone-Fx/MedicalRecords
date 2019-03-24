
CREATE TABLE departamento (
  id_departamento 	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL 
);

-- TABLE: municipio

CREATE TABLE municipio (
  id_municipio 	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL ,
  id_departamento INTEGER NOT NULL, 
  FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

-- TABLE: direccion

CREATE TABLE direccion (
  id_direccion 	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  id_municipio INTEGER NOT NULL ,
  referencia TEXT NOT NULL ,
  FOREIGN KEY (id_municipio) REFERENCES municipio(id_municipio)
);

-- TABLE: hospital

CREATE TABLE hospital (
  id_hospital 	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre TEXT NOT NULL ,
  id_direccion INTEGER NOT NULL ,
  telefono varchar NOT NULL ,
  FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);

-- TABLE: especialidad

CREATE TABLE especialidad (
  id_especialidad 	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  especialidad TEXT NOT NULL 
);

-- TABLE: medico

CREATE TABLE medico (
  id_medico INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  p_nombre TEXT NOT NULL ,
  p_pallido TEXT NOT NULL ,
  numero_junta TEXT NOT NULL ,
  id_especialidad INTEGER NOT NULL,
 id_hospital INTEGER NOT NULL, 
  usuario TEXT NOT NULL,
  contraseña TEXT NOT NULL,
    FOREIGN KEY (id_hospital) REFERENCES hospital(id_hospital),
	  FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad)
);

-- TABLE: persona

CREATE TABLE persona (
  id_persona 	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  p_nombre TEXT NOT NULL ,
  s_nombre TEXT NOT NULL ,
  p_aprellido TEXT NOT NULL ,
  s_apellido TEXT NOT NULL ,
  sexo TEXT NOT NULL ,
  fecha_nacimiento TEXT NULL ,
  DUI TEXT NULL,
  id_direccion INTEGER NOT NULL,
  FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);

-- TABLE: expediente

CREATE TABLE expediente (
  id_expediente TEXT NOT NULL ,
  id_medico INTEGER NOT NULL ,
  id_persona INTEGER NOT NULL ,
  fecha_creacion date NOT NULL ,
  padecimintos TEXT NULL,
  tipo_sangre TEXT NULL,
  estado TEXT NOT NULL,
  FOREIGN KEY (id_persona) REFERENCES persona(id_persona),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
);
 
-- TABLE: jornada

CREATE TABLE jornada (
  id_jornada 	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  fecha_jornda TEXT NOT NULL ,
  id_direccion INTEGER NOT NULL,
  FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion)
);

-- TABLE: historialmedico

CREATE TABLE historialmedico (
  id_Historial 	INTEGER NOT NULL,
  id_expediente TEXT NOT NULL ,
  moivo_consulta TEXT NOT NULL ,
  obsevaciones TEXT NOT NULL ,
  sintomas TEXT NOT NULL ,
  diagnostico TEXT NOT NULL ,
  id_medico INTEGER NOT NULL,
  id_jornada INTEGER NULL,
  id_hospital INTEGER NULL,
  PRIMARY KEY (id_Historial,id_expediente),
  FOREIGN KEY (id_expediente) REFERENCES expediente(id_expediente),
  FOREIGN KEY (id_jornada) REFERENCES jornada(id_jornada),
  FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
  FOREIGN KEY (id_hospital) REFERENCES hospital(id_hospital)
);

-- TABLE: citas

CREATE TABLE citas (
  id_cita 	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  fecha date NOT NULL ,
  id_medico INTEGER NOT NULL 
);

-- TABLE: referencia

CREATE TABLE referencia (
  id_referencia INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  id_especialidad INTEGER NOT NULL ,
  id_cita INTEGER NOT NULL ,
  id_hisotrial INTEGER NOT NULL ,
  id_expediente TEXT NOT NULL ,
  FOREIGN KEY (id_cita) REFERENCES citas(id_cita),
  FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad),
  FOREIGN KEY (id_hisotrial,id_expediente) REFERENCES historialmedico(id_Historial,id_expediente)
);

-- TABLE: tratamiento

CREATE TABLE tratamiento (
  id_tratamiento 	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  id_Historial INTEGER NOT NULL ,
  id_expediente TEXT NOT NULL ,
  medicamento TEXT NOT NULL ,
  indicaciones TEXT NOT NULL ,
  id_cita INTEGER NULL,
  FOREIGN KEY (id_Historial,id_expediente) REFERENCES historialmedico(id_Historial,id_expediente),
  FOREIGN KEY (id_cita) REFERENCES citas(id_cita)
);

-- TABLE: examenes

CREATE TABLE examenes (
  id_examen INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  id_historial INTEGER NOT NULL ,
  id_expediente TEXT NOT NULL ,
  realizar_en TEXT NOT NULL ,
  examen TEXT NOT NULL,
  fecha TEXT NOT NULL, 
    FOREIGN KEY (id_historial,id_expediente) REFERENCES historialmedico(id_Historial,id_expediente)
);



