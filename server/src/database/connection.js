import sql from 'mssql';

const dbSettings = {
    user: 'admin',
    password: 'root2021',
    server: 'localhost', //Propiedad server es la IP, si se habla de la instancia se pone DESKTOP-48GPRD5
    database: 'entonado',  
    // Opciones de conexion para desarrollo
    // Se evita hacer la conexion mediante SSL y para ello se usan las lineas de abajo
    // En caso de desplegar el servidor en azure o en la nube, se tiene que especificar 
    // otras opciones, ver en la documentacion.
    options: { 
        encrypt: true,
        trustServerCertificate: true,
    },
};

// Reiniciar el servidor de SQL Server cuando se terminen de hacer las configuraciones de la BD

async function getConnection(){

    try {
        const pool = await sql.connect(dbSettings);

        return pool;
    } catch (error) {
        console.log(error);
    }

    // const result = await pool.request().query('SELECT 1');
    // console.log(result);


}

getConnection();