% Cambiar las rutas de las librerias por si no son iguales
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Nifti' );
addpath( 'C:\Users\Usuario\Desktop\TFG\matlab\Vtk' );

datos1 = load( 'C:\Users\Usuario\Desktop\TFG\matlab\Scripts\warp_voxelmorph.mat' );

warp = datos1.warp_voxelmorph;

warp = permute(warp, [1,3,4,5, 2]);

% --

warp = squeeze(warp);

%  img = np.swapaxes( img, 1, 2)
%  img = np.flip( img, 1 ) 
%  img = np.flip( img, 0 ) 

% warp = permute( warp, [1, 3, 2, 4]);
% warp = flip(warp, 2);
% warp = flip(warp, 1);

dim = size( warp );

M = max(warp(:));
m = min(warp(:));

warp = (warp - m) / (M-m);

figure;
imshow( slice( warp, 1 ) );

imwrite( slice( warp, 1 ), sprintf( '%s_Flow_Sagittal.png', model ) );

figure;
imshow( slice( warp, 2 ) );

imwrite( slice( warp, 2 ), sprintf( '%s_Flow_Coronal.png', model ) );

figure;
imshow( slice( warp, 3 ) );

imwrite( slice( warp, 3 ), sprintf( '%s_Flow_Axial.png', model ) );


function s = slice( warp, dim )

    d = size(warp);

    if dim == 1
        s = warp( d(1) / 2 , :, :, : );
    end

    if dim == 2
        s = warp( :, d(2) / 2 , :, : );
    end

    if dim == 3
        s = warp( :, :, d(3) / 2 , : );
    end

    s = squeeze(s);

    s1 = flipud(s(:,:,1)');
    s2 = flipud(s(:,:,2)');
    s3 = flipud(s(:,:,3)');

    d = size(s1);

    s = zeros( d(1), d(2), 3 );

    s(:,:,1) = s1;
    s(:,:,2) = s2;
    s(:,:,3) = s3;
end