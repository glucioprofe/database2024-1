CREATE TABLE ubicaciones (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE
);

CREATE TABLE proveedores (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE,
    telefono VARCHAR(15) NULL,
    correo VARCHAR(100) NULL
);

CREATE TABLE tipos (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE
);
CREATE TABLE extintores (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    capacidad INT UNSIGNED,
    fechafabricacion DATE,
    estado VARCHAR(50),
    idtipo INT UNSIGNED,
    idubicacion INT UNSIGNED,
    idproveedor INT UNSIGNED,
    FOREIGN KEY (idtipo) REFERENCES tipos(id),
    FOREIGN KEY (idubicacion) REFERENCES ubicaciones(id),
    FOREIGN KEY (idproveedor) REFERENCES proveedores(id)
);

CREATE TABLE inspecciones (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idextintor INT UNSIGNED,
    fecha DATE,
    proximainspeccion DATE,
    FOREIGN KEY (idextintor) REFERENCES extintores(id)
);

CREATE TABLE recargas (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idextintor INT UNSIGNED,
    fecha DATE,
    proximarecarga DATE,
    FOREIGN KEY (idextintor) REFERENCES extintores(id)
);
