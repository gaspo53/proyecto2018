  CREATE DATABASE proyecto_2018_parcial;
  USE proyecto_2018_parcial;

  CREATE TABLE categoria (
    id int(11) NOT NULL AUTO_INCREMENT,
    nombre varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (id)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

  INSERT INTO categoria (id, nombre) VALUES (1, 'Trabajo');
  INSERT INTO categoria (id, nombre) VALUES (2, 'Viajes');
  INSERT INTO categoria (id, nombre) VALUES (3, 'Familia');
  INSERT INTO categoria (id, nombre) VALUES (4, 'Facultad');

  CREATE TABLE estado (
    id int(11) NOT NULL AUTO_INCREMENT,
    nombre varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (id)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

  INSERT INTO estado (id, nombre) VALUES (1, 'Nueva');
  INSERT INTO estado (id, nombre) VALUES (2, 'Eliminada');
  INSERT INTO estado (id, nombre) VALUES (3, 'Finalizada');

  CREATE TABLE usuario (
    id int(11) NOT NULL AUTO_INCREMENT,
    usuario varchar(50) NOT NULL,
    clave varchar(255) NOT NULL,
    nombre varchar(100) NOT NULL,
    apellido varchar(100) NOT NULL,
    mail varchar(45) NOT NULL,
    PRIMARY KEY (id)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

  INSERT INTO usuario (id, usuario, clave, nombre, apellido, mail) VALUES (1, 'john.doe', 'sin nombre', 'John', 'Doe', 'johndoe@gmail.com');

  CREATE TABLE tarea (
    id int(11) NOT NULL AUTO_INCREMENT,
    titulo varchar(255) NOT NULL,
    categoria_id int(10) NOT NULL, -- Referencia al ID de la tabla categoraa
    estado_id int(10) NOT NULL, -- Referencia al ID de la tabla estado
    usuario_id int(10) NOT NULL, -- Referencia al ID de la tabla usuario
    PRIMARY KEY (id),
    CONSTRAINT FK_categoria_id FOREIGN KEY (categoria_id) REFERENCES categoria(id),
    CONSTRAINT FK_estado_id FOREIGN KEY (estado_id) REFERENCES estado(id),
    CONSTRAINT FK_usuario_id FOREIGN KEY (usuario_id) REFERENCES usuario(id)
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

  INSERT INTO tarea (titulo, categoria_id, estado_id, usuario_id) VALUES ('Finalizar presentación', 1, 3, 1);
  INSERT INTO tarea (titulo, categoria_id, estado_id, usuario_id) VALUES ('Sacar pasajes', 2, 3, 1);
  INSERT INTO tarea (titulo, categoria_id, estado_id, usuario_id) VALUES ('Comprar regalo de cumpleaños', 3, 1, 1);
