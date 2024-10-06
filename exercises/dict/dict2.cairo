// dict2.cairo
// Dictionaries can be used to simulate dynamic array : the value they store can be accessed and modified.
// Your task is to create a function that multiplies the elements stored at the indexes 0 to n of a dictionary by 10
// Make me compile and pass the test!
// Execute `starklings hint dict2` or use the `hint` watch subcommand for a hint.

fn multiply_element_by_10(ref dict: Felt252Dict<u32>, n: usize) {
    //TODO : make a function that multiplies the elements stored at the indexes 0 to n of a dictionary by 10
    let mut curr_index: felt252 = 0;
    while curr_index.try_into().unwrap()     < n {
        dict.insert(curr_index, dict.get(curr_index) * 10);
        curr_index += 1;
    }


}

// Don't change anything in the test
#[test]
#[available_gas(2000000000)]
fn test_3() {
    let mut dict: Felt252Dict<u32> = Default::default();
    dict.insert(0, 1);
    dict.insert(1, 2);
    dict.insert(2, 3);

    multiply_element_by_10(ref dict, 3);

    assert(dict.get(0) == 10, 'First element is not 10');
    assert(dict.get(1) == 20, 'Second element is not 20');
    assert(dict.get(2) == 30, 'Third element is not 30');
}

#[test]
#[available_gas(200000000)]
fn test_4() {
    let mut dict: Felt252Dict<u32> = Default::default();
    dict.insert(0, 1);
    dict.insert(1, 2);
    dict.insert(2, 5);
    dict.insert(3, 10);

    multiply_element_by_10(ref dict, 4);

    assert(dict.get(2) == 50, 'First element is not 50');
    assert(dict.get(3) == 100, 'First element is not 100');

}