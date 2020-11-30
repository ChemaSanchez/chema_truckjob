Config = {
    JobCenter = vector3(961.78, -2189.57, 29.55),
    ReAdd = 60, -- seconds after a job is finished until its shown again
    Job = {
        ['jobRequired'] = false, -- if true: only players with the specified job can work, false everyone can work
        ['jobName'] = 'trucker',
    },
    Jobs = {
        -- {title = 'title', payment = reward, vehicles = {'truck', 'trailer'}, start = {vector3(x, y, z), heading}, trailer = {vector3(x, y, z), heading}, arrive = vector3(x, y, z)}
        {title = 'Trabajo Ikea', payment = 7500, vehicles = {'phantom', 'trailers'}, start = {vector3(954.77, -2188.86, 29.63), 84.99}, trailer = {vector3(939.0, -1799.2, 30.1), 175.78}, arrive = vector3(2671.0, 3530.35, 51.26)},
        {title = 'Trabajo a una Tienda', payment = 5000, vehicles = {'packer', 'trailers2'}, start = {vector3(951.81, -2176.14, 30.50), 84.99}, trailer = {vector3(946.29, -2111.86, 29.64), 86.76}, arrive = vector3(103.57, -1819.37, 25.56)}
    },
}

Strings = {
    ['not_job'] = "¡No tienes el trabajo de camionero!",
    ['somebody_doing'] = '¡Alguien ya está haciendo este trabajo, por favor seleccione otro!',
    ['menu_title'] = 'Camionero - elegir trabajo',
    ['e_browse_jobs'] = 'Presione ~INPUT_CONTEXT~ para buscar trabajos disponibles',
    ['start_job'] = 'Camionero',
    ['truck'] = 'Camion',
    ['trailer'] = 'Trailer',
    ['get_to_truck'] = 'Coge el ~y~Camion~w~!',
    ['get_to_trailer'] = 'Conduce hasta el ~y~trailer~w~ y enganchalo!',
    ['destination'] = 'Destino',
    ['get_out'] = 'Sal de tu ~y~Camion~w~!',
    ['park'] = 'Estaciona el ~y~ trailer~w~ en el destino.',
    ['park_truck'] = 'Estaciona el ~y~camion~w~ en el destino.',
    ['drive_destination'] = 'conduce al ~b~destino~w~.',
    ['reward'] = 'Justo a tiempo! Has recibido ~g~€~w~%s',
    ['paid_damages'] = 'Pero que es esto! Me quedo ~r~€~w~%s por los daños!',
    ['drive_back'] = 'Conduce el ~y~camion ~w~de regreso a donde lo cogiste.', 
    ['detach'] = 'Desengancha el trailer [Manten H].'
    
}