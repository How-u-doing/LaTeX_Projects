template<typename RandomIt, typename Compare>
void sortingMethods<RandomIt, Compare>::BubbleSort(RandomIt first, RandomIt last, Compare comp)
{	
#if defined Cocktail_shaker_sort
	// see also <https://en.wikipedia.org/wiki/Cocktail_shaker_sort>
	// Example: list (2,3,4,5,1), which would only need to go through one pass (indeed 1.5 pass, one
	// more left-to-rigth comparison) of cocktail sort to become sorted, but if using an ascending 
	// bubble sort would take four passes. However one cocktail sort pass should be counted as two 
	// bubble sort passes. Typically cocktail sort is less than two times faster than bubble sort.
	int n = last - first;
	int m = 1;
	int lastLeftSwappedIndex;	// index of last left-side sorted
	int lastRightSwappedIndex;	// index of first right-side sorted
	while (n > m) {
		lastLeftSwappedIndex = n - 1;
		lastRightSwappedIndex = 0;
		for (int i = m; i < n; ++i) {
			if (comp(*(first + i), *(first + i - 1))) {
				swap(first + i, first + i - 1);
				lastRightSwappedIndex = i;
			}
		}
		n = lastRightSwappedIndex;

		if (n == 0)	// no swap, no need to compare right-to-left back
			return;

		for (int j = n - 1; j >= m; --j) {
			if (comp(*(first + j), *(first + j - 1))) {
				swap(first + j, first + j - 1);
				lastLeftSwappedIndex = j;
			}
		}
		m = lastLeftSwappedIndex;
	}

#else	// just left-to-right bubble sort
	// see also <https://en.wikipedia.org/wiki/Bubble_sort#Optimizing_bubble_sort>
	int n = last - first;	// unsorted length
	int lastSwappedIndex = 0;
	while (n > 1) {
		lastSwappedIndex = 0;
		for (int i = 1; i < n; ++i) {
			if (comp(*(first + i), *(first + i - 1))) {
				swap(first + i, first + i - 1);
				lastSwappedIndex = i;
			}
		}
		n = lastSwappedIndex;
	}
#endif // defined Cocktail_shaker_sort
}