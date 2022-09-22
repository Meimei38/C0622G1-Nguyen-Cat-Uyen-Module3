package algo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public  class DemoAlgo1 {

            static int[] solution(int[][] arr) {
                List<Integer> output = new ArrayList<>();
                for (int i = 0; i < arr.length; i++) {
                    for (int j = 0; j < arr[i].length; j++) {
                        output.add(arr[i][j]);
                    }
                }
                for (int i = 0; i < output.size(); i++) {
                    if (output.get(i) < 2) {
                        output.remove(output.get(i));
                        i--;

                    } else {
                        for (int j = 2; j < output.get(i); j++) {
                            if (output.get(i) % j == 0) {
                                output.remove(output.get(i));
                                i--;
                            }
                        }
                    }
                }
                Collections.sort(output);
                return output.stream().mapToInt(Integer::intValue).toArray();
            }

            public static void main(String[] args) {
            int[][] arr = {
                    {1, 2, 8, 43},
                    {9, 4, 53, 7},
                    {11, 6, 4, 0},
                    {1, 2, 6, 51}
            };
            System.out.println(Arrays.toString(solution(arr)));

        }

    }

