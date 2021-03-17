---
title: "Algorithms Dynamic Programming"
date: 2021-03-15T09:04:18+01:00
tags: [Algorithms]
categories: [Learn]
featuredImagePreview: "dynamicprogramming.png"
---

# Algorithms 03

## when it's used

1. Maximum, Minimum

2. judge, if Something's possible

3. calculate the Amount of the Plans

## when it's NOT used

1. specific Plan instead of the Amount of Plans ( [Plaindrome Partitioning](https://leetcode.com/problems/palindrome-partitioning/) )

2. Input is a Set instead of a Sequence ( [Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence/) )

## 4 Points

1. Defination of States

2. Transform-Function

3. Initialization ( Start )

4. Answer ( End )

## Types of DP

1. Coordinate

2. Sequence

3. Double-Sequence

## Some Tips

- when initialize a __2D-Matrix, initialize its 1.st Row and 1.st Column__.

## Exercises on LeetCode

### Coordinate

- [LeetCode 45. Jump Game II](https://leetcode.com/problems/jump-game-ii/)

    ```java
    class Solution {
        public int jump(int[] nums) {
            int size = nums.length;
            int[] f = new int[size];
            f[0] = 0;
            
            for(int i = 1; i < size; i++){
                f[i] = Integer.MAX_VALUE;
                for(int j = 0; j < i; j++){
                    if(f[j] != Integer.MAX_VALUE && j + nums[j] >= i){
                        f[i] = f[j] + 1;
                        // break;
                    }
                }
            }
            
            return f[size - 1];
        }
    }
    ```

- [LeetCode 55. Jump Game](https://leetcode.com/problems/jump-game/)

    ```java
    class Solution {
        public boolean canJump(int[] nums) {
            
            boolean[] f = new boolean[nums.length];
            f[0] = true;
            
            for(int i = 1; i < nums.length; i++){
                for(int j = 0; j < i; j++){
                    if(f[j] && j + nums[j] >= i){
                        f[i] = true;
                        break;
                    }
                }
            }
            
            return f[nums.length - 1];
        }
    }
    ```

- [LeetCode 62. Unique Paths](https://leetcode.com/problems/unique-paths/)
  
    ```java
    class Solution {
        public int uniquePaths(int m, int n) {
            
            int[][]f = new int[m][n];
            
            for(int i = 0; i < m; i++)
                f[i][0] = 1;
            for(int j = 0; j < n; j++)
                f[0][j] = 1;
        
            for(int i = 1; i < m; i++)
                for(int j = 1; j < n; j++)
                    f[i][j] = f[i - 1][j] + f[i][j - 1];
            
            return f[m - 1][n - 1];
            
        }
    }
    ```

- [LeetCode 64. Minimum Path Sum](https://leetcode.com/problems/minimum-path-sum/)

    ```java
    class Solution {
        public int minPathSum(int[][] grid) {
            if(grid == null || grid.length == 0)
                return 0;
            int m = grid.length, n = grid[0].length;
            int[][] f = new int[m][n];
            
            for(int i = 0; i < m; i++)
                for(int j = 0; j < n; j++)
                    f[i][j] = Integer.MAX_VALUE;
            
            f[0][0] = grid[0][0];
            // Initialization
            for(int i = 1; i < m; i++)
                f[i][0] = f[i - 1][0] + grid[i][0];
            
            for(int j = 1; j < n; j++)
                f[0][j] = f[0][j - 1] + grid[0][j];
            // DP
            for(int i = 1; i < m; i++)
                for(int j = 1; j < n; j++)
                    f[i][j] = Math.min(f[i - 1][j], f[i][j - 1]) + grid[i][j];
            
            return f[m - 1][n - 1];
        }
    }
    ```

- [LeetCode 120. Triangle](https://leetcode.com/problems/triangle/)

    - Traverse ( Time Limit Exceeded )
         
        ```java
        class Solution {
          
            private int best = Integer.MAX_VALUE;
              
            private void traverse(int x, int y, int sum, List<List<Integer>> triangle){
                if(x == triangle.size()){
                    if(sum < best)
                        best = sum;
                    return;
                }

                traverse(x + 1, y, sum + triangle.get(x).get(y), triangle);
                traverse(x + 1, y + 1, sum + triangle.get(x).get(y), triangle);
            }

            public int minimumTotal(List<List<Integer>> triangle) {
                traverse(0, 0, 0, triangle);
                return best;
            }
        }
        ```
     
    - Divide & Conquer ( Time Limit Exceeded )
     
        ```java
        class Solution {

            private int divideConquer(int x, int y, List<List<Integer>> triangle){
                if(x == triangle.size())
                    return 0;
                return triangle.get(x).get(y) + Math.min(divideConquer(x + 1, y, triangle), divideConquer(x + 1, y + 1, triangle));
            }
             
            public int minimumTotal(List<List<Integer>> triangle) {
                return divideConquer(0, 0, triangle);
            }
        }
        ```

     - Divide & Conquer with Memorization
         
        ```java
        class Solution {

            private int divideConquer(int x, int y, List<List<Integer>> triangle, int[][] hash){
                if(x == triangle.size())
                    return 0;
                 
                if(hash[x][y] != Integer.MAX_VALUE)
                    return hash[x][y];
                hash[x][y] = triangle.get(x).get(y) + Math.min(divideConquer(x + 1, y, triangle, hash), divideConquer(x + 1, y + 1, triangle, hash));
                 
                return hash[x][y];
            }
             
            public int minimumTotal(List<List<Integer>> triangle) {
                int m = triangle.size();
                int n = triangle.get(m - 1).size();
                int[][] hash = new int [m][n];
                for(int i = 0; i < m; i++){
                    for(int j = 0; j < n; j++)
                        hash[i][j] = Integer.MAX_VALUE;
                }
                return divideConquer(0, 0, triangle, hash);
            }
        }
        ```

    - DP
   
        ```java
        class Solution {
            public int minimumTotal(List<List<Integer>> triangle) {
                 
                int n = triangle.size();
                int[][] f = new int[n][n];
                 
                f[0][0] = triangle.get(0).get(0);
                // Initialize the 2 Edges of the Triangle, Start
                for(int i = 1; i < n; i++){
                    f[i][0] = f[i - 1][0] + triangle.get(i).get(0);
                    f[i][i] = f[i - 1][i - 1] + triangle.get(i).get(i);
                }
                // DP, Top to Bottom
                for(int i = 1; i < n; i++){
                    for(int j = 1; j < i; j++)
                        f[i][j] = Math.min(f[i - 1][j], f[i - 1][j - 1]) + triangle.get(i).get(j);
                }
                 
                int answer = Integer.MAX_VALUE;
                for(int i = 0; i < n; i++)
                    answer = Math.min(answer, f[n - 1][i]);
                 
                return answer;
                 
            }
        }
        ```
- [LeetCode 300. Longest Increasing Subsequence](https://leetcode.com/problems/longest-increasing-subsequence/)

    ```java
    class Solution {
        public int lengthOfLIS(int[] nums) {
            if(nums == null || nums.length == 0)
                return 0;
            
            int[] f = new int[nums.length];
            // Array f storages the LIS in i_th Location
            int max = 0;
            
            for(int i = 0; i < nums.length; i++){
                f[i] = 1;
                // the for-loop below picks out the maximum in f[j], j in [0, i)
                for(int j = 0; j < i; j++){
                    if(nums[j] < nums[i])
                        f[i] = f[i] > f[j] + 1 ? f[i] : f[j] + 1;
                }
                if(f[i] > max)
                    max = f[i];
            }
            
            return max;
        }
    }
    ```

### Subsequence

#### single

1. State: f[i] represents Alphabets / Numbers / Locations __before__ i ( different from LIS, ont i_th )

2. Function: f[i] = f[j]...( j < i )

3. Initialization: f[0]...

4. Answer: f[n - 1]...


- [LeetCode 132. Palindrome Partitioning II (HARD)](https://leetcode.com/problems/palindrome-partitioning-ii/)

    ```java
    class Solution {
    
        private boolean isPalindrome(String s, int start, int end){
            for(int i = start, j = end; i < j; i++, j--){
                if(s.charAt(i) != s.charAt(j))
                    return false;
            }
            return true;
        }
        
        private boolean[][] getIsPalindrome(String s){
            // this Function is DP, too
            // DP-Type: subArea
            boolean [][] isPalindrome = new boolean[s.length()][s.length()];
            
            // single Alphabet is palindrom
            for(int i = 0; i < s.length(); i++)
                isPalindrome[i][i] = true;
            // judge if every 2 Alphabets are palindrom
            for(int i = 0; i < s.length() - 1; i++)
                isPalindrome[i][i + 1] = (s.charAt(i) == s.charAt(i + 1));
            
            for(int length = 2; length < s.length(); length++){
                // Length of subArea
                // f[i][j] depends on f[i + 1][j - 1]
                for(int start = 0; start + length < s.length(); start++){
                    isPalindrome[start][start + length] = 
                        isPalindrome[start + 1][start + length - 1] 
                        && s.charAt(start) == s.charAt(start + length);
                }
            }
            
            return isPalindrome;
        }
        
        public int minCut(String s) {
            if(s == null || s.length() == 0)
                return 0;
            boolean[][] isPalindrome = getIsPalindrome(s);
            
            int[] f = new int[s.length() + 1];
            
            // Initialization
            // worst Case: we seperate a String into single Alphabet.
            // we have 5 Fingers and 4 Gaps among them
            for(int i = 0; i <= s.length(); i++)
                f[i] = i - 1;
            // but why f[0] = -1?
            // Case "abba"
            
            // DP below
            for(int i = 1; i <= s.length(); i++){
                for(int j = 0; j < i; j++){
                    // if subString(j, i-1) is palindrom.
                    // (j+1)_th to i_th subString.
                    if(isPalindrome[j][i - 1])
                        f[i] = Math.min(f[i], f[j] + 1);
                    // we can also write it this way:
                    // if(isPalindrome(s, j, i - 1))
                    // by using 2D-Matrix we optimize the Complexity to O(1).
                }
            }
            
            return f[s.length()];
        }
    }
    ```