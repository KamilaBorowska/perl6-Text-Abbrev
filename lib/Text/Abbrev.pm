module Abbrev;
multi sub abbrev (*@words) is export {
    my $seen = KeySet.new;
    my %result;
    for @words {
        for 1 .. .chars -> $len {
            my $abbrev = .substr(0, $len);
            if $seen{$abbrev} {
                %result.delete: $abbrev;
            }
            else {
                $seen{$abbrev} = 1;
                %result{$abbrev} = $_;
            }
        }
    }
    for @words {
        %result{$_} = $_;
    }
    return %result;
}
