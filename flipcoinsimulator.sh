#!/bin/bash -x

heads=0
tails=0


while true
do
 coin=$[($RANDOM%2)]

	case  $coin in 
			0  )
			   ((heads++))
				;;

			1  )

			   ((tails++))
       				;;
	esac

	if (($heads == 21 || $tails==21))
    	then
		break;
	fi
done

echo "heads="$heads
echo "tails="$tails

if (($heads > $tails))
then
	diff=$[(heads-tails)]
	echo "heads won by"$diff
fi

if (($tails > $heads))
then
	diff=$[(tails-heads)]
	echo "tails won by"$diff
fi



