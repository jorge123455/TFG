% Cambiar las rutas de las librerias por si no son iguales
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Nifti' );
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Vtk' );
%addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\SynthSeg' );

%partes = load('C:\Users\Usuario\Desktop\TFG\matlab\Scripts\region_hipocampo_MCI_SyMNet.mat');
partes = load_nii('C:\Users\Usuario\Desktop\TFG\matlab\Segmentacion\seg_altas5LapIRN.nii');

%partes = partes.SyMNet_hipocampo_MCI;

%imagen = partes{1};

%imagen = imagen.img;

imagen1 = partes.img;

disp(size(imagen1));

imagen = make_nii(imagen1);

view_nii(imagen);

figure;

% Corte sagital para la segunda matriz (matriz2)
subplot(1,3,1);
sagital = squeeze(imagen1(round(size(imagen1, 1)/2), :, :))';
sagital = imrotate(sagital, 90); % Rotar 90 grados
sagital = imrotate(sagital, 90); % Rotar 90 grados
colormap('jet');
axis equal;
imshow(sagital, []);
colorbar;
title('Corte Sagital');
clim([0, 60]);

% Corte coronal para la segunda matriz (matriz2)
subplot(1,3,2);
coronal = squeeze(imagen1( :, round(size(imagen1, 2)/2), :));
coronal = imrotate(coronal, 90); % Rotar 90 grados
%colormap('jet');
axis equal;
imshow(coronal, []);
colorbar;
title('Corte Coronal');
clim([0, 60]);

% Corte axial para la segunda matriz (matriz2)
subplot(1,3,3);
axial = squeeze(imagen1(:, :, round(size(imagen1, 3)/2)));
axial = imrotate(axial, 90); % Rotar 90 grados
%colormap('jet');
axis equal;
imshow(axial, []);
colorbar;
title('Corte Axial');
clim([0, 60]);
colormap('jet');

% Ajustar el tamaño de la figura
set(gcf, 'Position', [100, 100, 1200, 400]); % Cambiar los valores según sea necesario
