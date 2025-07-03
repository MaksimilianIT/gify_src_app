Although most of the requirements have been implemented with success, two optional bonus features were not fulfilled because of the time priority and technical scope:

    ## Page Navigation Separation:
    Instead of using a centralized routing system such as go_router, the navigation was done inline with Navigator.push. Although the current implementation works perfectly, adding a specialist in navigation coordination would be possible at the cost of reorganizing screen transitions. This was taken into consideration and postponed to keep the focus on the core features completion.

    Network Availability Management:
    I would utilize the connectivity_plus package to check the network and give feedback to the user in offline mode. This feature was not however integrated due to time limitations and focus of core functionality and UI polish. The application now presupposes the internet connection to make Giphy API requests.
