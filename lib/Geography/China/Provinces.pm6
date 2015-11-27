use v6;

unit class Geography::China::Provinces;

my %AREAS =
    1 => {
        en => 'Huabei',
        zh => '华北',
    },
    2 => {
        en => 'Dongbei',
        zh => '东北',
    },
    3 => {
        en => 'Huadong',
        zh => '华东',
    },
    4 => {
        en => 'Zhongnan',
        zh => '中南',
    },
    5 => {
        en => 'Xinan',
        zh => '西南',
    },
    6 => {
        en => 'Xibei',
        zh => '西北',
    };

my %CATEGORIES =
    1 => {
        en => 'Municipality',
        zh => '直辖市',
    },
    2 => {
        en => 'Province',
        zh => '省',
    },
    3 => {
        en => 'Autonomous Region',
        zh => '自治区',
    },
    4 => {
        en => 'Special Administrative Region',
        zh => '特別行政区',
    };

my @REGIONS =
    {   iso      => 11,
        category => 1,
        area     => 1,
        name     => { en => 'Beijing', zh => '北京市' },
        abbr     => { en => 'BJ', zh => '京' },
    },
    {   iso      => 12,
        category => 1,
        area     => 1,
        name     => { en => 'Tianjin', zh => '天津市' },
        abbr     => { en => 'TJ', zh => '津' },
    };

sub create-region(%region) {
    %region<area>     = %AREAS{%region<area>};
    %region<category> = %CATEGORIES{%region<category>};
    %region;
}

method iso(Int $iso) {
    @REGIONS ==> grep { $_<iso> == $iso } ==> map { create-region(%($_)) } ==> my @res;
    @res[0];
}
