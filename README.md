### Summary: Include screen shots or a video of your app highlighting its features

![IMG_4314](https://github.com/user-attachments/assets/dc6af6e3-477e-49ac-9d7e-74095769a0ad)
![IMG_4313](https://github.com/user-attachments/assets/3c6badf4-a7b1-439d-9fc7-bbd8ab98ed3b)


### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

I proiritized image caching because that is something I usually let a third party handle and I wanted to take on the challenge. I think my efforts paid off because the image caching works great and I even put in a little activity indicator and fade in transition when the image loads.

And although I have a lot of experience with it, I also made a conscious effort to make sure my networking was working well with error handling and such because I know that stuff is important to these kinds of positions.

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

I spent around 3 days working on this project. First day was getting the networking setup/UI.

Second day I learned how to cache images and then I implemented it.

Third day I wrote the unit tests and polished the UI.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

To build off the "prioritizing image caching" I just mentioned, there was a section in my code where I chose more CPU pressure over more network calls. To limit the number of network calls, I implemented an optimization that copies previous recipe images when the user refreshes so they don't have to redownload the same images all over again. However, this was pretty CPU costly (N^2) but I believe it was worth it because I wanted to make the image caching as smooth as possible.

Another trade off I made was exclusively caching the large image instead of the small ones. While this does cost more memory, it does save on having to make a network call to download the big picture everytime you view a recipe.

### Weakest Part of the Project: What do you think is the weakest part of your project?

My project follows MVVM and I am satisfied with how I implemented it, but there are small architecture decisions that I think could be polished on. For example, there is a function in my view model that gets the recipes and a function that gets the image data. The former gets and returns the recipes, while the latter gets and sets the image data. It's a bit inconsistent and I want some feedback on how better I could implement it.

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.

This is the third take-home test I have submitted to Fetch (3 different roles). I really truly believe that I am qualified for this role. I have progressed so much as an iOS Engineer since my first submission and I think the quality of my code is night and day. I really truly want to grow as an iOS Engineer and this looks like the dream role to do so. I promise I will give my absolute best to any opportunity given to me.
