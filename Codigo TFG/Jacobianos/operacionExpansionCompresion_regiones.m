% Cambiar las rutas de las librerias por si no son iguales
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Nifti' );
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Vtk' );

datos1 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\region_ventriculo_CN_SyMNet.mat' );
datos2 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\region_ventriculo_MCI_SyMNet.mat' );

lista_jacobianos_CN = datos1.SyMNet_ventriculo_CN;
lista_jacobianos_MCI = datos2.SyMNet_ventriculo_MCI;

valor = lista_jacobianos_CN{1}.img;

suma_imagenes = zeros(size(valor)); % Inicializar la suma
for i = 1:229
    suma_imagenes = suma_imagenes + lista_jacobianos_CN{i}.img;
end
media_jacobianos_CN = suma_imagenes / 229;

suma_imagenes = zeros(size(valor)); % Inicializar la suma
for i = 1:286
    suma_imagenes = suma_imagenes + lista_jacobianos_MCI{i}.img;
end
media_jacobianos_MCI = suma_imagenes / 286;

resta = media_jacobianos_MCI - media_jacobianos_CN;
divison = resta./media_jacobianos_CN;

figura2_ventriculo_CN_MCI_SyMNet = make_nii(divison);

save('figura2_ventriculo_CN_MCI_SyMNet.mat', 'figura2_ventriculo_CN_MCI_SyMNet');

view_nii( figura2_ventriculo_CN_MCI_SyMNet );