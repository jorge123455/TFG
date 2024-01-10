% Cambiar las rutas de las librerias por si no son iguales
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Nifti' );
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Vtk' );

datos = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\figura2_ventriculo_CN_MCI_SyMNet.mat' );

valor = datos.figura2_ventriculo_CN_MCI_SyMNet;

valor = valor.img;

imagen = make_nii(valor);

view_nii(imagen);

figure;

% Corte sagital para la segunda matriz (matriz2)
subplot(1,3,1);
sagital = squeeze(valor(56, :, :))';
sagital = imrotate(sagital, 90); % Rotar 90 grados
sagital = imrotate(sagital, 90); % Rotar 90 grados
%imagesc(flipud(sagital), [-0.3, 0.3]);
%colormap('jet');
axis equal;
imagesc(sagital);
colorbar;
title('Corte Sagital');
clim([-0.3, 0.3]);

% Cambiar tamaño de la primera imagen (cuadrado pequeño)
posicion1 = get(gca, 'Position');
posicion1(1) = posicion1(1) * 0.3; % Duplicar el ancho
posicion1(3) = posicion1(3) * 1.6; % Reducir el ancho a la mitad
posicion1(4) = posicion1(4) * 0.5; % Reducir la altura a la mitad
set(gca, 'Position', posicion1);

% Corte coronal para la segunda matriz (matriz2)
subplot(1,3,2);
coronal = squeeze(valor( :, 93, :));
coronal = imrotate(coronal, 90); % Rotar 90 grados
%imagesc(flipud(coronal), [-0.3, 0.3]);
%colormap('jet');
axis equal;
imagesc(coronal);
colorbar;
title('Corte Coronal');
clim([-0.3, 0.3]);

% Cambiar tamaño de la segunda imagen (rectángulo grande)
posicion2 = get(gca, 'Position');
posicion2(1) = posicion2(1) * 1.15; % Duplicar el ancho
posicion2(3) = posicion2(3) * 0.9; % Duplicar el ancho
posicion2(4) = posicion2(4) * 0.5; % Duplicar el ancho
set(gca, 'Position', posicion2);

% Corte axial para la segunda matriz (matriz2)
subplot(1,3,3);
axial = squeeze(valor(:, :, 31));
axial = imrotate(axial, 90); % Rotar 90 grados
%imagesc(flipud(axial), [-0.3, 0.3]);
%colormap('jet');
axis equal;
imagesc(axial);
colorbar;
title('Corte Axial');
clim([-0.3, 0.3]);
colormap('jet');

% Cambiar tamaño de la tercera imagen (rectángulo grande)
posicion3 = get(gca, 'Position');
posicion3(1) = posicion3(1) * 1.1; % Duplicar el ancho
posicion3(3) = posicion3(3) * 0.9; % Duplicar el ancho
posicion3(4) = posicion3(4) * 1; % Duplicar el ancho
set(gca, 'Position', posicion3);

% Ajustar el tamaño de la figura
set(gcf, 'Position', [100, 100, 1200, 400]); % Cambiar los valores según sea necesario