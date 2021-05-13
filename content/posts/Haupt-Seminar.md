---
title: "Haupt Seminar"
date: 2021-04-26T16:38:33+02:00
draft: false
tags: [Kurse]
categories: [TUD]
featuredImagePreview: "/TUD.png"
---

## Some Definitions

### Network Edge

- Where devices or local network interfaces with Internet

### Fog/Edge/Mobile-Edge Computing

- Fog/Edge Computing is a distributed computing paradigm that brings data storage and computation closer to where it is needed to improve the response time and save bandwidth.

- Mobile Edge Computing is a network archietecture which enables the cloud computing capabilities and IT services at the edge of the network.

### Software-Defined-Network

- Features:

  - Decoupling the data plane and control plane

- Advantages:

  - Get a global overview of the network from data plane

- Components:

  - SDN controller
    - Gather the entire behaviors of network, orchestration & resource management
  - SDN-based edge server
    - Provide computation and storage for vehicles, store regional road information, provide emergency service
  - SDN micro based station
    - Running OpenFlow, delivering edge services
  - SDN-base road side units
    - Running OpenFlow, exchange data with vehicles
  - SDN-based smart vehicle
    - On-Board Unit and OpenFlow, end user

- Issues:
  - Security
  - Scalability
  - Elasticity

### Network-Function-Virtualization

- Features:
  - With the help of IT virtualization technology, virtualize the entire classes of network node functions into building blocks that may connect, or chain together, to create communication services.

### Advices from Mr.Sommer

- So, to start with: you managed to successfully give your kick-off presentation, so you're still in the seminar

- Please also keep in mind that the kick-off presentation is supposed to present one paper in detail. This is totally different to the thesis talk at the end of the seminar, which will require you to give a high level overview of your topic

- In your kick-off presentation you managed to present the contents of the paper, but I was somewhat confused that you stuck so closely to how the paper was laid out - it's almost like you summarized every 4 paragraphs of the paper into one sentence of your own, then presented that

- Of course, that's enough to pass the first stage of the seminar, but it's very far removed from what you are supposed to do in the final presentation.

- In the seminar talk (or the seminar thesis), if you find yourself explaining parts of a single paper, you probably went into too much detail. What is required of you in the seminar talk/thesis is to discuss commonalities of multiple papers (or differences of these papers)
With this out of the way, let me briefly move on the the talk itself:

- Your presentation was eloquent and easy to follow, the slide design was simple, but very efficient

- You could easily make your (virtual) presentation more engaging if you could look at the audience (i.e., your lens) more often

- Lastly, I was missing a footer on your slides - a common line on every slide (that shows 1) who's talking, 2) what they are talking about, and 3) which slide number is currently presented) helps follow your presentation and (most importantly) makes it easier to ask questions

- that is, the audience can raise a question like "could you please explain the picture on slide 5" as opposed to "can you please go back a slide; no, forward; one more; one more; okay, maybe it was the other way"... which wastes a lot of time during Q&A

- I can also recommend asking Dr. Hensel for feedback - he took very good notes as well

---

- I am happy to see that you've made a very important observation: different papers define the same term differently. This is why it is so important to introduce terms in your thesis before using them ("Foobar Computing, which is commonly used to mean XYZ, has gained ...")

  Browsing through your screenshots it is clear that there are a lot of common distinctions that papers draw between, e.g., fog and edge computing. It is your personal contribution (and also your duty) to arrive at a distinction in your thesis that makes sense (based on the literature you read) and to clearly communicate it to your readers.

  For example, only one paper treats the two terms as interchangeable, so I would argue that it would not be following the consensus of the literature to treat the two terms as interchangeable in your seminar thesis.

- Ok😄 I’ll try to make clear distinctions in thesis.🙌And one more question, since Cisco is the “creator” of fog computing, and now on its website Cisco regard FC as a subset of EC(the last picture), does that mean that the second figure is better compared to the first figure?

- I can only answer this question in a very generic fashion: by default, I would treat exactly those authors as the "creators" of a concept/methodology that first described it in a scientific (peer reviewed) paper. Very often (but not always), this is also the paper that is cited most often for further information on a concept (e.g., "fog computing [1] is being used to XYZ").

  On a related note, it is also (unfortunately) very common to simply use the exact same method X that somebody else invented, but to give it a new term Y - just to be able to claim that "I invented Y"; this is particularly common if Y is claimed as an invention by somebody who is in the market of selling Y.

- Roger that🙌 I'll try to figure this out. Thanks again for your time(especially today's holiday)🍻