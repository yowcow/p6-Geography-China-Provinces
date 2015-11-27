use v6;
use Geography::China::Provinces;
use Test;

subtest {

    subtest {
        my $res = Geography::China::Provinces.iso(12);

        is-deeply $res,
            {
            iso      => 12,
            name     => { en => 'Tianjin', zh => '天津市' },
            abbr     => { en => 'TJ', zh => '津' },
            area     => { en => 'Huabei', zh => '华北' },
            category => { en => 'Municipality', zh => '直辖市' },
            };
    }, 'iso => 12';

}, 'Test `iso`';

done-testing;

