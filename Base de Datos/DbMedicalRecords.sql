-- Base de datos para Expedientes medicos 
-- la base de daatos en ta pensada para de arrollar 
-- 2 aplicativos uno de escritorio y uno para andorid 
-- se trato de mantener la mayor catidad de infroamcion posible, donde la mayor parte de forma general 
-- donde la mayoria de los campos seran descripciones 

CREATE TABLE departamento (
  id_departamento serial NOT NULL ,
  nombre varchar(30) NOT NULL 
);

-- 
ALTER TABLE departamento ADD CONSTRAINT Pkdepartamento_restricción_única PRIMARY KEY (id_departamento);

-- TABLE: municipio

CREATE TABLE municipio (
  id_municipio serial NOT NULL ,
  nombre varchar(30) NOT NULL ,
  id_departamento int NOT NULL 
);

-- 
ALTER TABLE municipio ADD CONSTRAINT Pkmunicipio_restricción_única PRIMARY KEY (id_municipio);

-- 
ALTER TABLE municipio ADD CONSTRAINT departamentoMunicipio_restricción_fclave FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento) ON UPDATE NO ACTION ON DELETE NO ACTION;


-- TABLE: direccion

CREATE TABLE direccion (
  id_direccion serial NOT NULL ,
  id_municipio int NOT NULL ,
  referencia varchar(30) NOT NULL 
);

-- 
ALTER TABLE direccion ADD CONSTRAINT Pkdireccion_restricción_única PRIMARY KEY (id_direccion);

-- 
ALTER TABLE direccion ADD CONSTRAINT municipioDirecion_restricción_fclave FOREIGN KEY (id_municipio) REFERENCES municipio(id_municipio) ON UPDATE NO ACTION ON DELETE NO ACTION;

-- TABLE: hospital

CREATE TABLE hospital (
  id_hospital serial NOT NULL ,
 -- numero_esturctura varchar(30) NOT NULL ,
  nombre varchar(30) NOT NULL ,
  id_direccion int NOT NULL ,
  telefono varchar NOT NULL 
);

-- 
ALTER TABLE hospital ADD CONSTRAINT Pkhospital_restricción_única PRIMARY KEY (id_hospital);

-- 
ALTER TABLE hospital ADD CONSTRAINT direccionHospital_restricción_fclave FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion) ON UPDATE NO ACTION ON DELETE NO ACTION;

-- TABLE: especialidad

CREATE TABLE especialidad (
  id_especialidad serial NOT NULL ,
  especialidad varchar(60) NOT NULL 
);

-- 
ALTER TABLE especialidad ADD CONSTRAINT Pkespecialidad_restricción_única PRIMARY KEY (id_especialidad);



-- TABLE: medico

CREATE TABLE medico (
  id_medico serial NOT NULL ,
  p_nombre varchar(30) NOT NULL ,
  p_pallido varchar(30) NOT NULL ,
  numero_junta varchar(30) NOT NULL ,
  id_especialidad int NOT NULL ,
  id_hospital int NOT NULL, 
  usuario varchar(30) NOT NULL,
  contraseña varchar(30) NOT NULL
);

-- 
ALTER TABLE medico ADD CONSTRAINT Pkmedico_restricción_única PRIMARY KEY (id_medico);

-- 
ALTER TABLE medico ADD CONSTRAINT hospitalMedico_restricción_fclave FOREIGN KEY (id_hospital) REFERENCES hospital(id_hospital) ON UPDATE NO ACTION ON DELETE NO ACTION;

-- 
ALTER TABLE medico ADD CONSTRAINT especialidadMedico_restricción_fclave FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad) ON UPDATE NO ACTION ON DELETE NO ACTION;


-- TABLE: persona

CREATE TABLE persona (
  id_persona serial NOT NULL ,
  p_nombre varchar(30) NOT NULL ,
  s_nombre varchar(30) NOT NULL ,
  p_aprellido varchar(30) NOT NULL ,
  s_apellido varchar(30) NOT NULL ,
  sexo varchar(30) NOT NULL ,
  fecha_nacimiento date NULL ,
  DUI varchar(30) NULL,
  id_direccion int NOT NULL 
);

-- 
ALTER TABLE persona ADD CONSTRAINT Pkpersona_restricción_única PRIMARY KEY (id_persona);

-- 
ALTER TABLE persona ADD CONSTRAINT direccionPersona_restricción_fclave FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion) ON UPDATE NO ACTION ON DELETE NO ACTION;

-- TABLE: expediente

CREATE TABLE expediente (
  id_expediente varchar(20) NOT NULL ,
  id_medico int NOT NULL ,
  id_persona int NOT NULL ,
  fecha_creacion date NOT NULL ,
  padecimintos varchar(100) NULL,
  tipo_sangre varchar(20) NULL,
  estado varchar(30) NOT NULL 
);

-- 
ALTER TABLE expediente ADD CONSTRAINT Pkexpediente_restricción_única PRIMARY KEY (id_expediente);

-- 
ALTER TABLE expediente ADD CONSTRAINT medicoExpediente_restricción_fclave FOREIGN KEY (id_medico) REFERENCES medico(id_medico) ON UPDATE NO ACTION ON DELETE NO ACTION;

-- 
ALTER TABLE expediente ADD CONSTRAINT personaExpediente_restricción_fclave FOREIGN KEY (id_persona) REFERENCES persona(id_persona) ON UPDATE NO ACTION ON DELETE NO ACTION;

-- TABLE: jornada

CREATE TABLE jornada (
  id_jornada serial NOT NULL ,
  fecha_jornda varchar(30) NOT NULL ,
  id_direccion int NOT NULL 
);

-- 
ALTER TABLE jornada ADD CONSTRAINT Pkjornada_restricción_única PRIMARY KEY (id_jornada);

-- 
ALTER TABLE jornada ADD CONSTRAINT direccionJornada_restricción_fclave FOREIGN KEY (id_direccion) REFERENCES direccion(id_direccion) ON UPDATE NO ACTION ON DELETE NO ACTION;


-- TABLE: historialmedico

CREATE TABLE historialmedico (
  id_Historial serial NOT NULL ,
  id_expediente varchar(20) NOT NULL ,
  moivo_consulta varchar(800) NOT NULL ,
  obsevaciones varchar(800) NOT NULL ,
  sintomas varchar(800) NOT NULL ,
  diagnostico varchar(800) NOT NULL ,
  id_medico int NOT NULL ,
  id_jornada int NULL, 
  id_hospital int NULL
);

-- 
ALTER TABLE historialmedico ADD CONSTRAINT Pkhistorialmedico_restricción_única PRIMARY KEY (id_Historial,id_expediente);

-- 
ALTER TABLE historialmedico ADD CONSTRAINT expedienteHistorial_restricción_fclave FOREIGN KEY (id_expediente) REFERENCES expediente(id_expediente) ON UPDATE NO ACTION ON DELETE NO ACTION;

-- 
ALTER TABLE historialmedico ADD CONSTRAINT jornadaHistorial_restricción_fclave FOREIGN KEY (id_jornada) REFERENCES jornada(id_jornada) ON UPDATE NO ACTION ON DELETE NO ACTION;

-- 
ALTER TABLE historialmedico ADD CONSTRAINT medicoHistorial_restricción_fclave FOREIGN KEY (id_medico) REFERENCES medico(id_medico) ON UPDATE NO ACTION ON DELETE NO ACTION;

-- 
ALTER TABLE historialmedico ADD CONSTRAINT hospitalHistorial_restricción_fclave FOREIGN KEY (id_Historial) REFERENCES hospital(id_hospital) ON UPDATE NO ACTION ON DELETE NO ACTION;

-- TABLE: citas

CREATE TABLE citas (
  id_cita serial NOT NULL ,
  fecha date NOT NULL ,
  id_medico int NOT NULL 
);

-- 
ALTER TABLE citas ADD CONSTRAINT Pkcitas_restricción_única PRIMARY KEY (id_cita);

-- TABLE: referencia

CREATE TABLE referencia (
  id_referencia serial NOT NULL ,
  id_especialidad int NOT NULL ,
  id_cita int NOT NULL ,
  id_hisotrial int NOT NULL ,
  id_expediente varchar(20) NOT NULL 
);

-- 
ALTER TABLE referencia ADD CONSTRAINT Pkreferencias_restricción_única PRIMARY KEY (id_referencia);

-- 
ALTER TABLE referencia ADD CONSTRAINT historialReferencia_restricción_fclave FOREIGN KEY (id_hisotrial,id_expediente) REFERENCES historialmedico(id_Historial,id_expediente) ON UPDATE NO ACTION ON DELETE NO ACTION;

-- 
ALTER TABLE referencia ADD CONSTRAINT citaReferencia_restricción_fclave FOREIGN KEY (id_cita) REFERENCES citas(id_cita) ON UPDATE NO ACTION ON DELETE NO ACTION;

-- 
ALTER TABLE referencia ADD CONSTRAINT especialidadReferencia_restricción_fclave FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad) ON UPDATE NO ACTION ON DELETE NO ACTION;

-- TABLE: tratamiento

CREATE TABLE tratamiento (
  id_tratamiento serial NOT NULL ,
  id_Historial int NOT NULL ,
  id_expediente varchar(20) NOT NULL ,
  medicamento varchar(800) NOT NULL ,
  indicaciones varchar(800) NOT NULL ,
  id_cita int NULL
);

-- 
ALTER TABLE tratamiento ADD CONSTRAINT Pktratamiento_restricción_única PRIMARY KEY (id_tratamiento);

-- 
ALTER TABLE tratamiento ADD CONSTRAINT historialTratamiento_restricción_fclave FOREIGN KEY (id_Historial,id_expediente) REFERENCES historialmedico(id_Historial,id_expediente) ON UPDATE NO ACTION ON DELETE NO ACTION;

-- 
ALTER TABLE tratamiento ADD CONSTRAINT citaTratamiento_restricción_fclave FOREIGN KEY (id_cita) REFERENCES citas(id_cita) ON UPDATE NO ACTION ON DELETE NO ACTION;

-- TABLE: examenes

CREATE TABLE examenes (
  id_examen serial NOT NULL ,
  id_historial int NOT NULL ,
  id_expediente varchar(20) NOT NULL ,
  realizar_en varchar(60) NOT NULL ,
  examen varchar(500) NOT NULL,
  fecha date NOT NULL 
);

-- 
ALTER TABLE examenes ADD CONSTRAINT Pkexamen_restricción_única PRIMARY KEY (id_examen);

-- 
ALTER TABLE examenes ADD CONSTRAINT HistorialExamen_restricción_fclave FOREIGN KEY (id_historial,id_expediente) REFERENCES historialmedico(id_Historial,id_expediente) ON UPDATE NO ACTION ON DELETE NO ACTION;


