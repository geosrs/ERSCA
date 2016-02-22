function gisData = computeExt5(gisData)
%% ���ݳ�ȡ
other_building = ( gisData.data(:,6)==1 ); % ���վ�ס��
self_building = ( gisData.data(:,7)>=1 );

gisData.other_building = other_building;
gisData.self_building = self_building;

% ���Ծ�ס����block
gisData.all_building = (other_building | self_building);

%% �����ˮ����չ����
fsq_Idxs = gisData.data(gisData.all_building, 20);
fsq_Idxs = unique(fsq_Idxs);

% ����ÿ����ˮ���ڵĸ��غͽ����ֲ����
gisData.ext_fsq = NaN(size(fsq_Idxs,1), 2);
for i = 1:length(fsq_Idxs)
    [gisData.ext_fsq(i,1), gisData.ext_fsq(i,2)] = ...
        computeRegionALFsq(gisData, other_building|self_building, fsq_Idxs(i));
end


%% ���������������С����
other_min_dist = computeMinDist(gisData, other_building, self_building, gisData.K);
gisData.ext_otherDist = other_min_dist(self_building);