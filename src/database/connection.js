import sql from 'mssql';

const dbSettings = {
    user: 'admin',
    password: 'root2021',
    server: '127.0.0.1', //Propiedad server es la IP, si se habla de la instancia se pone DESKTOP-48GPRD5
    database: 'control_calidad',
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

export async function getConnection() {

    try {
        const pool = await sql.connect(dbSettings);
        return pool;
    } catch (error) {
        console.log(error);
    }

}

export { sql };