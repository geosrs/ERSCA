function gisData = GisSetup(gisData)
gisData.v = 1;

% areaType = 1; Բ������, ����������
gisData.areaType = 1;

gisData.R = 500;   % ��Χ�뾶, ��λm
gisData.K = 10;     % ȡǰK����С�����ƽ��ֵ��Ϊ�����������С����

gisData.FileName = sprintf('map-%d-P4-2',gisData.R);

% ͬʱ��������ÿ����������Ľ��������������, ������С����, ������ÿ�����������Ϣ��(buildings)
gisData.data_ext_num = 8;

gisData.Expand = [2     3	4	5	6	7; ...
                  0.5   0.8 0.9 0.96 0.99 1];
              
% ����ѡַ
 % ѡ��S��Χ�ڵĵ���Ϊѡַ��, ��S = inf,��ʾ��ѡ��Ϊ��ͼ�����е�
gisData.S = 4000;  % ѡַ�뾶, ��λm
 % ѡַ��׼�� 1. ֻ����Ȼ���ԣ�2��ֻ��������ԣ�3�����߶���
gisData.PropertyType = 3;

% ���ڽ�������
% ѧϰ���� 
%gisData.Split.Model = @(b,x)(b(1)./x+b(3)*exp(-b(2)*x));
gisData.Split.Model = @(b,x)(b(2)*exp(b(1)*x));
%gisData.Split.Model = @(b,x)(b(2)+b(1)./x);
gisData.SplitProb = 0.11;   % ���Ѹ���
gisData.Split.beta = SpeedModeling(gisData.Split.Model);

% ���ڽ�����������
gisData.Expand.Model = @(b,x)(b(1)*(exp(-b(3)*x+b(2))));
gisData.Expand.beta = AreaSpeedModeling(gisData.Expand.Model);
gisData.Expand.Ratio = 107;  % ��ˮ�����ø���/��ˮ���������.
% ��ʼ��
if strcmp(gisData.blocksize, '20x20'),
    gisData.StartPoint = [43629,43630];
elseif strcmp(gisData.blocksize, '10x10'),
    gisData.StartPoint = [173289];
end

if gisData.v == 1,
    if strcmp(gisData.blocksize, '20x20'),
        fprintf('GisData Reading (20x20) ... \n');
    elseif strcmp(gisData.blocksize, '10x10'),
        fprintf('GisData Reading (10x10) ... \n');
    end
end

