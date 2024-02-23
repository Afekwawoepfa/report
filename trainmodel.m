function model = trainmodel(train,train_label,netname,layer)
%trainmodel DCNN特徴量からSVMでモデルを学習
%   model 学習したモデル
%   train 学習データ(ファイル名) 
%   train_label 対応するラベル
%   netname 使用するネットワーク
%   layer DCNNに使用するレイヤー
    net = netname;
    IM = [];
    for i = 1:length(train)
        I = imread(train{i});
        I = imresize(I, net.Layers(1).InputSize(1:2));
        IM = cat(4, IM, I);
    end
 
    dcnnf = activations(net,IM,layer);  
    dcnnf = squeeze(dcnnf);
    dcnnf = dcnnf/norm(dcnnf);    

    model = fitcsvm(dcnnf', train_label, 'KernelFunction','linear');
end