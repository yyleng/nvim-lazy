#include <iostream>
// quick sort
void quick_sort(int arr[], int left, int right) {
    if (left >= right)
        return;
    int i = left, j = right;
    int pivot = arr[left];
    while (i < j) {
        while (i < j && arr[j] >= pivot)
            j--;
        arr[i] = arr[j];
        while (i < j && arr[i] <= pivot)
            i++;
        arr[j] = arr[i];
    }
    arr[i] = pivot;
    quick_sort(arr, left, i - 1);
    quick_sort(arr, i + 1, right);
}

int main() {
    int arr[] = {3, 2, 1, 4, 5};
    quick_sort(arr, 0, 4);
    for (int i = 0; i < 5; i++) {
        std::cout << arr[i] << " ";
    }
    std::cout << std::endl;
    return 0;
}
