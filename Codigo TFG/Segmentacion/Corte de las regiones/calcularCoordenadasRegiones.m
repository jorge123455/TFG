% Cambiar las rutas de las librerias por si no son iguales
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Nifti' );
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Vtk' );

% Cargar los atlas segmentados
nii1 = load_nii('C:\Users\Usuario\Desktop\TFG\matlab\Segmentacion\seg_controlTemplateSqueeze.nii');
nii2 = load_nii('C:\Users\Usuario\Desktop\TFG\matlab\Segmentacion\seg_altas5LapIRN.nii');
nii3 = load_nii('C:\Users\Usuario\Desktop\TFG\matlab\Segmentacion\seg_altas5SyMNet.nii');

% Obtener los datos de la imagen y el tamaño
img1 = nii1.img;
dims1 = size(img1);

img2 = nii2.img;
dims2 = size(img2);

img3 = nii3.img;
dims3 = size(img3);

% Obtener las regiones de interes segun el etiquetado de SynthSeg
left_lateral_ventricle = 4;
right_lateral_ventricle = 43;

left_thalamus = 10;
right_thalamus = 49;

left_hippocampus = 17;
right_hippocampus = 53;

regiones_voxelmorph = cell(3,1);
regiones_LapIRN = cell(3,1);
regiones_SyMNet = cell(3,1);

% Obtener las coordenadas que pertenecen a cada region para cada metodo
[filas1, columnas1, profundidades1] = ind2sub(size(img1), find(img1 == left_lateral_ventricle));
[filas2, columnas2, profundidades2] = ind2sub(size(img1), find(img1 == right_lateral_ventricle));

regiones_coord = [filas1(:), columnas1(:), profundidades1(:); filas2(:), columnas2(:), profundidades2(:)];
regiones_voxelmorph{1} = single(regiones_coord);

[filas1, columnas1, profundidades1] = ind2sub(size(img1), find(img1 == left_thalamus));
[filas2, columnas2, profundidades2] = ind2sub(size(img1), find(img1 == right_thalamus));

regiones_coord = [filas1(:), columnas1(:), profundidades1(:); filas2(:), columnas2(:), profundidades2(:)];
regiones_voxelmorph{2} = single(regiones_coord);

[filas1, columnas1, profundidades1] = ind2sub(size(img1), find(img1 == left_hippocampus));
[filas2, columnas2, profundidades2] = ind2sub(size(img1), find(img1 == right_hippocampus));

regiones_coord = [filas1(:), columnas1(:), profundidades1(:); filas2(:), columnas2(:), profundidades2(:)];
regiones_voxelmorph{3} = single(regiones_coord);

disp(regiones_voxelmorph);

[filas1, columnas1, profundidades1] = ind2sub(size(img2), find(img2 == left_lateral_ventricle));
[filas2, columnas2, profundidades2] = ind2sub(size(img2), find(img2 == right_lateral_ventricle));

regiones_coord = [filas1(:), columnas1(:), profundidades1(:); filas2(:), columnas2(:), profundidades2(:)];
regiones_LapIRN{1} = single(regiones_coord);

[filas1, columnas1, profundidades1] = ind2sub(size(img2), find(img2 == left_thalamus));
[filas2, columnas2, profundidades2] = ind2sub(size(img2), find(img2 == right_thalamus));

regiones_coord = [filas1(:), columnas1(:), profundidades1(:); filas2(:), columnas2(:), profundidades2(:)];
regiones_LapIRN{2} = single(regiones_coord);

[filas1, columnas1, profundidades1] = ind2sub(size(img2), find(img2 == left_hippocampus));
[filas2, columnas2, profundidades2] = ind2sub(size(img2), find(img2 == right_hippocampus));

regiones_coord = [filas1(:), columnas1(:), profundidades1(:); filas2(:), columnas2(:), profundidades2(:)];
regiones_LapIRN{3} = single(regiones_coord);

disp(regiones_LapIRN);

[filas1, columnas1, profundidades1] = ind2sub(size(img3), find(img3 == left_lateral_ventricle));
[filas2, columnas2, profundidades2] = ind2sub(size(img3), find(img3 == right_lateral_ventricle));

regiones_coord = [filas1(:), columnas1(:), profundidades1(:); filas2(:), columnas2(:), profundidades2(:)];
regiones_SyMNet{1} = single(regiones_coord);

[filas1, columnas1, profundidades1] = ind2sub(size(img3), find(img3 == left_thalamus));
[filas2, columnas2, profundidades2] = ind2sub(size(img3), find(img3 == right_thalamus));

regiones_coord = [filas1(:), columnas1(:), profundidades1(:); filas2(:), columnas2(:), profundidades2(:)];
regiones_SyMNet{2} = single(regiones_coord);

[filas1, columnas1, profundidades1] = ind2sub(size(img3), find(img3 == left_hippocampus));
[filas2, columnas2, profundidades2] = ind2sub(size(img3), find(img3 == right_hippocampus));

regiones_coord = [filas1(:), columnas1(:), profundidades1(:); filas2(:), columnas2(:), profundidades2(:)];
regiones_SyMNet{3} = single(regiones_coord);

disp(regiones_SyMNet);

% Guardar las coordenadas de las regiones
save('regiones_voxelmorph.mat', 'regiones_voxelmorph');
save('regiones_LapIRN.mat', 'regiones_LapIRN');
save('regiones_SyMNet.mat', 'regiones_SyMNet');