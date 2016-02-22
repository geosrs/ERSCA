function dataInfoN = ModelAnalysisV5(gisData)
% �������ݷ���

data_p1 = gisData.data(gisData.all_building,:);
data_p2 = gisData.ext_fsq;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure

%--1����������̾���--%%%%%%%%%%%%%%%%%%
i = 1;
tmp_data = data_p1(:,15)';
dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% ������������
dataInfoN(i).name = '��������̾���';
dataInfoN(i).barNum = 15;  % ��Ͱ����
% ģ�Ͳ�������
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=3;   % ��˹�����
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=10;       % ��������
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

% ģ���޸�: ������Ӱ������
dataInfoN(i).model.rGMM = dataInfoN(i).model.GMM;
for j=1:length(dataInfoN(i).model.rGMM)
    dataInfoN(i).model.rGMM(j).sigma = 4*dataInfoN(i).model.rGMM(j).sigma;
end

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--2����ɽˮ������̾���--%%%%%%%%%%%%%%%%%%
i = 2;
tmp_data = data_p1(:,16)';
dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% ������������
dataInfoN(i).name = '��ɽˮ������̾���';
dataInfoN(i).barNum = 15;  % ��Ͱ����
% ģ�Ͳ�������
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=3;   % ��˹�����
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=8;       % ��������
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

% ģ���޸�: ������Ӱ������
dataInfoN(i).model.rGMM = dataInfoN(i).model.GMM;
for j=1:length(dataInfoN(i).model.rGMM)
    dataInfoN(i).model.rGMM(j).sigma = 4*dataInfoN(i).model.rGMM(j).sigma;
end

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--3�����滮���·��̾���--%%%%%%%%%%%%%%%%%%
i = 3;
tmp_data = data_p1(:,17)';
dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% ������������
dataInfoN(i).name = '���滮���·��̾���';
dataInfoN(i).barNum = 10;  % ��Ͱ����
% ģ�Ͳ�������
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=5;   % ��˹�����
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=20;       % ��������
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

% ģ���޸�: �����СӰ���ǿ
dataInfoN(i).model.rGMM = dataInfoN(i).model.GMM;
for j=1:length(dataInfoN(i).model.rGMM)
    dataInfoN(i).model.rGMM(j).sigma = 0.3*dataInfoN(i).model.rGMM(j).sigma;
end

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--4��������·��̾���--%%%%%%%%%%%%%%%%%%
i = 4;
tmp_data = data_p1(:,23)';
% dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% ������������
dataInfoN(i).name = '������·��̾���';
dataInfoN(i).barNum = 5;  % ��Ͱ����
% ģ�Ͳ�������
% dataInfoN(i).model.covType=2;  
% dataInfoN(i).model.gaussianNum=2;   % ��˹�����
% gmmTrainParam=gmmTrainParamSet;
% gmmTrainParam.useKmeans=1;
% gmmTrainParam.dispOpt=1;
% gmmTrainParam.maxIteration=7;       % ��������
% dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
% dataInfoN(i) = modelTrain(dataInfoN(i));
dataInfoN(i).model.GMM.mu = 1500;
dataInfoN(i).model.GMM.sigma = (dataInfoN(i).model.GMM.mu/3)^2;
dataInfoN(i).model.GMM.w = 1;

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--5����������תվ��̾���--%%%%%%%%%%%%%%%%%%
i = 5;
tmp_data = data_p1(:,21)';
% dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% ������������
dataInfoN(i).name = '��������תվ��̾���';
dataInfoN(i).barNum = 15;  % ��Ͱ����
% ģ�Ͳ�������
% dataInfoN(i).model.covType=2;  
% dataInfoN(i).model.gaussianNum=2;   % ��˹�����
% gmmTrainParam=gmmTrainParamSet;
% gmmTrainParam.useKmeans=1;
% gmmTrainParam.dispOpt=1;
% gmmTrainParam.maxIteration=2;       % ��������
% dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
% dataInfoN(i) = modelTrain(dataInfoN(i));
dataInfoN(i).model.GMM.mu = 4500;
dataInfoN(i).model.GMM.sigma = (dataInfoN(i).model.GMM.mu/3)^2;
dataInfoN(i).model.GMM.w = 1;

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--6������ˮ������̾���--%%%%%%%%%%%%%%%%%%
i = 6;
tmp_data = data_p1(:,22)';
% dataInfoN(i).data = tmp_data(find(~isnan(tmp_data)));
% ������������
dataInfoN(i).name = '����ˮ������̾���';
dataInfoN(i).barNum = 6;  % ��Ͱ����
% ģ�Ͳ�������
% dataInfoN(i).model.covType=2;  
% dataInfoN(i).model.gaussianNum=2;   % ��˹�����
% gmmTrainParam=gmmTrainParamSet;
% gmmTrainParam.useKmeans=1;
% gmmTrainParam.dispOpt=1;
% gmmTrainParam.maxIteration=20;       % ��������
% dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
% dataInfoN(i) = modelTrain(dataInfoN(i));

dataInfoN(i).model.GMM.mu = 4500;
dataInfoN(i).model.GMM.sigma = (dataInfoN(i).model.GMM.mu/3)^2;
dataInfoN(i).model.GMM.w = 1;

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%--7����ˮ���ڸ������,��ˮ���ڼȴ潨�����--%%%%%%%%%%%%%%%%%%
i = 7;
tmp_data = data_p2(:,1:2)';
dataInfoN(i).data = tmp_data;
% ������������
dataInfoN(i).name = '��ˮ��';
dataInfoN(i).barNum = 6;  % ��Ͱ����
% ģ�Ͳ�������
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=6;   % ��˹�����
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=5;       % ��������
gmmTrainParam.figHandle = subplot(2,4,i);
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

drawDataInfo2(gmmTrainParam.figHandle, dataInfoN(i));


%--8�������彨������̾���--%%%%%%%%%%%%%%%%%%
i = 8;
tmp_data = gisData.ext_otherDist;
dataInfoN(i).data = tmp_data';
% ������������
dataInfoN(i).name = '�����彨������̾���';
dataInfoN(i).barNum = 9;  % ��Ͱ����
% ģ�Ͳ�������
dataInfoN(i).model.covType=2;  
dataInfoN(i).model.gaussianNum=2;   % ��˹�����
gmmTrainParam=gmmTrainParamSet;
gmmTrainParam.useKmeans=1;
gmmTrainParam.dispOpt=1;
gmmTrainParam.maxIteration=50;       % ��������
dataInfoN(i).model.gmmTrainParam = gmmTrainParam;
dataInfoN(i) = modelTrain(dataInfoN(i));

% ģ���޸�:  ѡȡ��ֵ��С�Ĳ���, ������ָ����Ȩ��, ���������򰴱�������ʣ���Ȩ��
dataInfoN(i).model.rGMM = dataInfoN(i).model.GMM;
mus = [dataInfoN(i).model.rGMM.mu];
[val, idx] = min(mus);
w_min = 0.95;
delta = (1-w_min)/(1-dataInfoN(i).model.rGMM(idx).w);
dataInfoN(i).model.rGMM(idx).w = w_min;
for j=1:length(dataInfoN(i).model.rGMM)
    if j ~= idx
        dataInfoN(i).model.rGMM(j).w = delta * dataInfoN(i).model.rGMM(j).w;
    end
end

handle = subplot(2,4,i);
drawDataInfo(handle, dataInfoN(i));


%==============================================================%
% ����������һЩ�������
dataInfoN = ShowResult(dataInfoN);



%% ģ��ѵ��
function dataInfo_I = modelTrain(dataInfo_I)
% ģ��ѵ��
% dataInfo.model.covType
% dataInfo.model.gaussianNum
% 
% gisData.model.gmmTrainParam = gmmTrainParam;
% gmmTrainParam.useKmeans
% gmmTrainParam.dispOpt
% gmmTrainParam.maxIteration;
% 
% gisData.model.GMM
%
% ѵ�����˹ģ��
[dataInfo_I.model.GMM, logLike]=gmmTrain(dataInfo_I.data, [dataInfo_I.model.gaussianNum, dataInfo_I.model.covType], dataInfo_I.model.gmmTrainParam);

% % ѵ������˹ģ��
% model = dataInfo_I.model;
% model.gaussianNum = 1;
% model.gmmTrainParam.maxIteration = 1000;
% 
% [dataInfo_I.model.SG, logLike]=gmmTrain(dataInfo_I.data, [model.gaussianNum, model.covType], model.gmmTrainParam);



function drawDataInfo(handle, dataInfo)
% dataInfo.data ����
% dataInfo.model
% dataInfo.name
% dataInfo.barNum

subplot(handle);
cla(handle);
if ~isempty(dataInfo.data)
    % Step1�� ���ɺ���������
    minData = min(dataInfo.data);
    maxData = max(dataInfo.data);
    endLength = abs(maxData-minData)*0.05;
    x = minData-endLength:0.1:maxData+endLength;
    % Step2: ������״ͼ
    [num, center] = hist(dataInfo.data,dataInfo.barNum);
    % num = num/sum(num);
    num = num/trapz(center,num);
    bar(center, num);
    % axis([x(1), x(end), 0, max(num)*1.02])
    axis tight
else
    x = 0:0.1:2*dataInfo.model.GMM(1).mu;
end

% Step3: ���Ƹ�˹���ģ��
if isfield(dataInfo.model, 'GMM')
    p_gmm = exp(gmmEval(x, dataInfo.model.GMM));
    hold on;
    % plot(x,p_gmm./max(p_gmm)*max(num)*1.03, 'r');
    plot(x,p_gmm, 'r');
    axis tight
end

% Step4: ����������ĸ�˹���ģ��
if isfield(dataInfo.model, 'rGMM')
    p_gmm = exp(gmmEval(x, dataInfo.model.rGMM));
    hold on;
    % plot(x,p_gmm./max(p_gmm)*max(num)*1.03, 'r');
    plot(x,p_gmm, 'g');
    axis tight
end
axis square;

title(dataInfo.name);

drawnow

% ��άͼ����
function drawDataInfo2(handle, dataInfo)
subplot(handle);
title(dataInfo.name)
drawnow


function dataInfo = ShowResult(dataInfo)
for i=1:length(dataInfo)
    % ������Сֵ�����ֵ
    dataInfo(i).minValue = min(dataInfo(i).data);
    dataInfo(i).maxValue = max(dataInfo(i).data);
    
    % Result Show
    fprintf('%s\n', dataInfo(i).name);
    fprintf('\t ��С��%f, ���%f \n', dataInfo(i).minValue, dataInfo(i).maxValue);
end