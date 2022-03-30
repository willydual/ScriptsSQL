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
            WHERE  idProducto = @IDPRODUCTO
        END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM productos
            WHERE  nombre = @NOMBRE
        END
  END