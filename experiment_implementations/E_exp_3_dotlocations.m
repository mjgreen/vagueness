    %%%%%%%%%%%%%%%%%%%
    % set up the dots %
    %%%%%%%%%%%%%%%%%%%

    % describe allowable dot locations
    % In this experiment we need up to 74 dots to be displayed at any one
    % time in any one square. The setup allows 100 locations.

    x=0;y=0;
    dots = [...
        [x-90;y-90] [x-70;y-90] [x-50;y-90] [x-30;y-90] [x-10;y-90] [x+10;y-90] [x+30;y-90] [x+50;y-90] [x+70;y-90] [x+90;y-90]...
        [x-90;y-70] [x-70;y-70] [x-50;y-70] [x-30;y-70] [x-10;y-70] [x+10;y-70] [x+30;y-70] [x+50;y-70] [x+70;y-70] [x+90;y-70]...
        [x-90;y-50] [x-70;y-50] [x-50;y-50] [x-30;y-50] [x-10;y-50] [x+10;y-50] [x+30;y-50] [x+50;y-50] [x+70;y-50] [x+90;y-50]...
        [x-90;y-30] [x-70;y-30] [x-50;y-30] [x-30;y-30] [x-10;y-30] [x+10;y-30] [x+30;y-30] [x+50;y-30] [x+70;y-30] [x+90;y-30]...
        [x-90;y-10] [x-70;y-10] [x-50;y-10] [x-30;y-10] [x-10;y-10] [x+10;y-10] [x+30;y-10] [x+50;y-10] [x+70;y-10] [x+90;y-10]...
        [x-90;y+10] [x-70;y+10] [x-50;y+10] [x-30;y+10] [x-10;y+10] [x+10;y+10] [x+30;y+10] [x+50;y+10] [x+70;y+10] [x+90;y+10]...
        [x-90;y+30] [x-70;y+30] [x-50;y+30] [x-30;y+30] [x-10;y+30] [x+10;y+30] [x+30;y+30] [x+50;y+30] [x+70;y+30] [x+90;y+30]...
        [x-90;y+50] [x-70;y+50] [x-50;y+50] [x-30;y+50] [x-10;y+50] [x+10;y+50] [x+30;y+50] [x+50;y+50] [x+70;y+50] [x+90;y+50]...
        [x-90;y+70] [x-70;y+70] [x-50;y+70] [x-30;y+70] [x-10;y+70] [x+10;y+70] [x+30;y+70] [x+50;y+70] [x+70;y+70] [x+90;y+70]...
        [x-90;y+90] [x-70;y+90] [x-50;y+90] [x-30;y+90] [x-10;y+90] [x+10;y+90] [x+30;y+90] [x+50;y+90] [x+70;y+90] [x+90;y+90]...
        ];
