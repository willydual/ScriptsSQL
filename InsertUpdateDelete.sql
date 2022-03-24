

CREATE TABLE producto
(
idProducto int not null primary key identity(1,1),
nombre varchar(100),
codigo varchar(100),
categoria varchar(100),
precio money
);

CREATE PROCEDURE SP_INSERTUPDATEDELETE (  @IDPRODUCTO      INTEGER,
                                          @NOMBRE          varchar(100),
                                          @CODIGO                   varchar(8),
                                          @CATEGORIA       VARCHAR(100),
                                          @PRECIO                 MONEY,
                                          @StatementType NVARCHAR(20) = '')
AS
  BEGIN
      IF @StatementType = 'Insert'
        BEGIN
            INSERT INTO productos
                        (nombre,
                         codigo,
                         categoria,
                         precio)
            VALUES     ( @NOMBRE,
                         @CODIGO,
                         @CATEGORIA,
                         @PRECIO)
        END

      IF @StatementType = 'Select'
        BEGIN
            SELECT *
            FROM   productos
        END

      IF @StatementType = 'Update'
        BEGIN
            UPDATE productos
            SET    nombre = @NOMBRE,
                   codigo = @CODIGO,
                   categoria = @CATEGORIA,
                   precio = @PRECIO
            WHERE  idproducto = @IDPRODUCTO
        END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM productos
            WHERE  nombre = @NOMBRE
        END
  END