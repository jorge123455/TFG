% Cambiar las rutas de las librerias por si no son iguales
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Nifti' );
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Vtk' );

% Cargamos los .mat de los jacobianos
%datos1 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\jacobianosYmediaCN_LapIRNexf.mat' );
datos2 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\jacobianosYmediaAD_LapIRNexf.mat' );
%datos3 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\jacobianosYmediasMCIexf.mat' );

% Cargamos las coordenadas de las regiones
coordenadas = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\regiones_LapIRN.mat' );
coordenadas = coordenadas.regiones_LapIRN;

%datos1 = datos1.jacobianos_CN;
datos2 = datos2.jacobianos_AD;
%datos3 = datos3.jacobianos_MCI;

% LapIRN_ventriculo_CN = cell(length(datos1),1);
% LapIRN_talamo_CN = cell(length(datos1),1);
% LapIRN_hipocampo_CN = cell(length(datos1),1);

LapIRN_ventriculo_AD = cell(length(datos2),1);
LapIRN_talamo_AD = cell(length(datos2),1);
LapIRN_hipocampo_AD = cell(length(datos2),1);

% voxelmorph_ventriculo_MCI = cell(length(datos3),1);
% voxelmorph_talamo_MCI = cell(length(datos3),1);
% voxelmorph_hipocampo_MCI = cell(length(datos3),1);

for i = 1:length(datos2)
    % Cargar la imagen .nii
    nii = datos2{i};
    image = nii.img; % Datos de la imagen
    
    % Obtener las coordenadas de la región correspondiente
    coordenadas_region_ventriculo = coordenadas{1};
    
    % Crear una máscara con ceros en toda la imagen
    mask = zeros(size(image));
    
    % Marcar los voxels de la región con unos en la máscara
    for j = 1:size(coordenadas_region_ventriculo, 1)
        x_coord = coordenadas_region_ventriculo(j, 1);
        y_coord = coordenadas_region_ventriculo(j, 2);
        z_coord = coordenadas_region_ventriculo(j, 3);
        
        mask(x_coord, y_coord, z_coord) = 1;
    end
    
    % Multiplicar la imagen original por la máscara para seleccionar la región
    region_seleccionada = image .* mask;

    x_coords = coordenadas_region_ventriculo(:, 1);
    y_coords = coordenadas_region_ventriculo(:, 2);
    z_coords = coordenadas_region_ventriculo(:, 3);

    x_min = min(x_coords);
    x_max = max(x_coords);
    y_min = min(y_coords);
    y_max = max(y_coords);
    z_min = min(z_coords);
    z_max = max(z_coords);
    
    % Crear una imagen más pequeña con las dimensiones de la región
    region_seleccionada = region_seleccionada(x_min:x_max, y_min:y_max, z_min:z_max);
    
    % Crear una nueva estructura NIfTI para la región seleccionada
    nii_seleccionado = make_nii(region_seleccionada);
    
    % Guardar el archivo .nii con la región seleccionada
    LapIRN_ventriculo_AD{i} = nii_seleccionado;
end

save('region_ventriculo_AD_LapIRN.mat', 'LapIRN_ventriculo_AD');

for i = 1:length(datos2)
    % Cargar la imagen .nii
    nii = datos2{i};
    image = nii.img; % Datos de la imagen
    
    % Obtener las coordenadas de la región correspondiente
    coordenadas_region_talamo = coordenadas{2}; 
    
    % Crear una máscara con ceros en toda la imagen
    mask = zeros(size(image));
    
    % Marcar los voxels de la región con unos en la máscara
    for j = 1:size(coordenadas_region_talamo, 1)
        x_coord = coordenadas_region_talamo(j, 1);
        y_coord = coordenadas_region_talamo(j, 2);
        z_coord = coordenadas_region_talamo(j, 3);
        
        mask(x_coord, y_coord, z_coord) = 1;
    end
    
    % Multiplicar la imagen original por la máscara para seleccionar la región
    region_seleccionada = image .* mask;

    x_coords = coordenadas_region_talamo(:, 1);
    y_coords = coordenadas_region_talamo(:, 2);
    z_coords = coordenadas_region_talamo(:, 3);

    x_min = min(x_coords);
    x_max = max(x_coords);
    y_min = min(y_coords);
    y_max = max(y_coords);
    z_min = min(z_coords);
    z_max = max(z_coords);
    
    % Crear una imagen más pequeña con las dimensiones de la región
    region_seleccionada = region_seleccionada(x_min:x_max, y_min:y_max, z_min:z_max);
    
    % Crear una nueva estructura NIfTI para la región seleccionada
    nii_seleccionado = make_nii(region_seleccionada);
    
    % Guardar el archivo .nii con la región seleccionada
    LapIRN_talamo_AD{i} = nii_seleccionado;
end

save('region_talamo_AD_LapIRN.mat', 'LapIRN_talamo_AD');

for i = 1:length(datos2)
    % Cargar la imagen .nii
    nii = datos2{i};
    image = nii.img; % Datos de la imagen
    
    % Obtener las coordenadas de la región correspondiente
    coordenadas_region_hipocampo = coordenadas{3};
    
    % Crear una máscara con ceros en toda la imagen
    mask = zeros(size(image));
    
    % Marcar los voxels de la región con unos en la máscara
    for j = 1:size(coordenadas_region_hipocampo, 1)
        x_coord = coordenadas_region_hipocampo(j, 1);
        y_coord = coordenadas_region_hipocampo(j, 2);
        z_coord = coordenadas_region_hipocampo(j, 3);
        
        mask(x_coord, y_coord, z_coord) = 1;
    end
    
    % Multiplicar la imagen original por la máscara para seleccionar la región
    region_seleccionada = image .* mask;

    x_coords = coordenadas_region_hipocampo(:, 1);
    y_coords = coordenadas_region_hipocampo(:, 2);
    z_coords = coordenadas_region_hipocampo(:, 3);

    x_min = min(x_coords);
    x_max = max(x_coords);
    y_min = min(y_coords);
    y_max = max(y_coords);
    z_min = min(z_coords);
    z_max = max(z_coords);
    
    % Crear una imagen más pequeña con las dimensiones de la región
    region_seleccionada = region_seleccionada(x_min:x_max, y_min:y_max, z_min:z_max);
    
    % Crear una nueva estructura NIfTI para la región seleccionada
    nii_seleccionado = make_nii(region_seleccionada);
    
    % Guardar el archivo .nii con la región seleccionada
    LapIRN_hipocampo_AD{i} = nii_seleccionado;
end

save('region_hipocampo_AD_LapIRN.mat', 'LapIRN_hipocampo_AD');