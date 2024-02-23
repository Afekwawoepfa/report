function [plabel,score] = predictmodel(model, eval, netname, layer)
%predictmodel DCNN特徴量からSVMでラベルを推定
%   plabel 推測したラベル
%   score スコア
%   model 学習したモデル
%   eval テストデータ
%   netname 使用するネットワーク
%   layer　DCNNに使用するレイヤー
    net = netname;
    IM = [];
    for i = 1:length(eval)
        I = imread(eval{i});
        I = imresize(I, net.Layers(1).InputSize(1:2));
        IM = cat(4, IM, I);
    end
 
    dcnnf = activations(net,IM,layer);  
    dcnnf = squeeze(dcnnf);
    dcnnf = dcnnf/norm(dcnnf);    

    [plabel, score] = predict(model, dcnnf');
end