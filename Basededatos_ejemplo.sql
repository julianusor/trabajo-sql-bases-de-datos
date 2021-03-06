CREATE TABLE
    persona(
        cedula INT(3) UNSIGNED NOT NULL PRIMARY KEY,
        nombre VARCHAR(40) NOT NULL,
        direccion VARCHAR(40),
        telefono VARCHAR(40)
    ) ENGINE = InnoDB;

CREATE TABLE
    empresa(
        nit INT(3) UNSIGNED NOT NULL PRIMARY KEY,
        nombre VARCHAR(40) NOT NULL,
        direccion VARCHAR(40) NOT NULL,
        pagina_web VARCHAR(40)
    ) ENGINE = InnoDB;

CREATE TABLE
    factura(
        codigo INT NOT NULL PRIMARY KEY,
        fecha DATE NOT NULL,
        valor VARCHAR(40),
        fecha_retorno DATE,
        tipo VARCHAR(1),
        cedula_p INT(3) UNSIGNED,
        FOREIGN KEY fk_p(cedula_p) REFERENCES persona(cedula)
        ON DELETE CASCADE,
        nit_E INT(3) UNSIGNED,
        FOREIGN KEY fk_e(nit_e) REFERENCES empresa(nit)
        ON DELETE CASCADE
    ) ENGINE = InnoDB;

INSERT INTO
    `empresa`(`nit`, `nombre`, `direccion`, `pagina_web`)
VALUES (1, 'postobon', 'CR-1 Cl-2 ', 'www.postobon.com');

INSERT INTO
    `empresa`(`nit`, `nombre`, `direccion`, `pagina_web`)
VALUES (2, 'cocacola', 'CR-2 cl-3', 'www.cocacola.com');

INSERT INTO
    `persona`(`cedula`, `nombre`, `DIRECCION`, `telefono`)
VALUES (1, 'Jota Mario Valencia', 'Cielo', '302456789');

INSERT INTO
    `persona`(`cedula`, `nombre`, `DIRECCION`, `telefono`)
VALUES (2, 'Marbelle Ramirez', 'Buenaventura', '302356789');

INSERT INTO
    `factura`(
        `codigo`,
        `fecha`,
        `valor`,
        `fecha_retorno`,
        `tipo`,
        `cedula_p`
    )
VALUES (
        1,
        DATE('2010-01-01'),
        500,
        DATE('2010-02-01'),
        'P',
        1
    );

INSERT INTO
    `factura`(
        `codigo`,
        `fecha`,
        `valor`,
        `fecha_retorno`,
        `tipo`,
        `cedula_p`
    )
VALUES (
        2,
        DATE('2012-05-01'),
        500,
        DATE('2016-02-01'),
        'P',
        2
    );

INSERT INTO
    `factura`(`codigo`, `fecha`, `valor`, `tipo`, `nit_e`)
VALUES (3, DATE('2010-01-01'), 50000, 'C', 1);

INSERT INTO
    `factura`(`codigo`, `fecha`, `valor`, `tipo`, `nit_e`)
VALUES (4, DATE('2012-05-01'), 50000, 'C', 2);