$a=8;$G{int(++$a/9).$a%9+1}=$_ for split//,<>;@A=1..9;sub c{int(($_[0]-1 # 火雞
)/3)*3}sub G{for$y(@A){for$x(@A){$t=$G{my$c=$y.$x}&&next;$t.=$G{$_.$x}.
$G{$y.$_}for@A;for$f(1..3){$t.=$G{c($y)+$f.c($x)+$_}for 1..3}G($G{$c}=$_
)for grep$t!~m/$_/,@A;return$G{$c}=0}}die map{$G{$_}||"\n"}9..100}G
