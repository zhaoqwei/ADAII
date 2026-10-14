function [hcb] = colorbarson(varargin)
%COLORBARSON 此处显示有关此函数的摘要
%   此处显示详细说明
hcb=colorbar('east');
hcb.AxisLocation="out";
% 获取当前子图的位置 [left bottom width height]
pos = get(hcb, 'Position');


% 设置colorbar的新位置，放右上角，缩小0.6倍高度，颜色条宽度0.02
cb_width = pos(3)*0.5; 
cb_height = pos(4)*0.5;
if ~isempty(varargin)
    cb_height=varargin{1};
end
cb_left = pos(1) + 0.5*cb_width;  % 右侧边界减去宽度
cb_bottom = pos(2) + 0.5*cb_height;  % 右上角起点

% 设置colorbar位置
set(hcb, 'Position', [cb_left, cb_bottom, cb_width, cb_height]);

pos1 = get(gca, 'Position');
cb_left = pos1(1) +pos1(3)+cb_width*0.2 ;  % 右侧边界减去宽度
cb_bottom = (pos1(2) + pos1(4))-cb_height;  % 右上角起点
set(hcb, 'Position', [cb_left, cb_bottom, cb_width, cb_height]);
% 留出图像和colorbar间隙（如果需要）
% set(gca, 'Position', [pos(1), pos(2), pos(3)-cb_width*1.1, pos(4)]);
end

