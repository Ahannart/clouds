function explore_data()

folder = '/Users/ahannart/Documents/bigdata/kaggle/clouds/';

list_pix = dir('/Users/ahannart/Documents/bigdata/kaggle/clouds/train_images');

i = 20;
pix = list_pix(i).name;
RGB = imread([folder 'train_images/' pix]);
G = double(rgb2gray(RGB));


v = find(G>70);
figure;
for k=1:8
    [la lo] = ind2sub(size(G), v(randi(length(v))));
    w = 30;
    if or(la+w>1400, la-w<1) continue; end    
    if or(lo+w>2100, lo-w<1) continue; end
    w = -w:w;
    X = G(la+w,lo+w);
    n = numel(X);
    x = reshape(X,n,1);
    u = find(x>0);

    h = 30;
    for i=-h:h
        for j=-h:h
            xij = reshape(G(la+w+i,lo+w+j),n,1);
            Sig(i+h+1,j+h+1) = corr(x(u),xij(u));
            'hi';
        end
    end
    subplot(3,8,k); imagesc(X);
    subplot(3,8,8+k); plot(Sig,'-'); ylim([-0.5 1]);
    subplot(3,8,16+k); imagesc(Sig); caxis([-0.5 0.8]);
    disp(k);
end
'hi';


end

