# Lab6 - **Resource Meta-Argument - depends_on**

## **Section-01: Lab Overview**

| *Current Resource Lab will serve two purposes*  Build a large number of AWS networking constructs via Terraform Manifests for significant, additional exposure to Resource manifest blocks. The AWS constructs to be created include: VPC  Subnet Internet Gateway Route Table Route in Route Table for Internet Access Associate Route Table with Subnet Create Security Group with in the VPC allowing ports 80 and 22 inbound Create EC2 Instance in VPC with a static key pair and with association of Security Group created prior Create Elastic IP Address and Associate to EC2 Instance Exposure to the Resource depends_on meta-argument when creating the Elastic IP |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

*GitHub Directory Code Location and Guidance*

-   The Github root directory for this lab and corresponding sub-directories are depicted below.
-   Use your own local copy of the repository for code execution and any code edits necessary.

![](media/d2b09959ee5be48c78b9bac03611c923.png)

## **Section-02: Create AWS EC2 Key Pairs for Lab Use**

-   Prior to our focus on the Terraform sections of this lab - an AWS key pair will be created for later usage in connecting to AWS EC2 compute instances
-   From within the AWS Console and for navigation to the EC2 Key Pairs creation screen:
    -   Type “key pairs” in the console search bar
    -   In the results returned - select “Key Pairs - EC2 feature” under the Features section
    -   The depiction below further clarifies selections

![](media/6946f92183d6ed324a54a6bd4fd24840.png)

-   From the subsequent screen - select the “Create key pair” button as depicted below

![](media/5d817a53b5ca36f9ef90efdfda8ba170.png)

-   Create a unique key pair for your lab pod with the following attributes:
    -   Name: terraform-key-\<pod-number\>
    -   File Format: The File format should be pem (which is likely selected by default)
-   Click the “Create key pair” button when above attributes are set
-   When the Key Pair is created - a copy will automatically download to your PC and likely into your Downloads folder. This file will be used in later labs so note the location of the file for future use and copy to a different directory (I.e. a AWS key pair local directory you may want to create for this class) for ease of location in the future if desired.

![](media/c0a4ecf2449c90435b38a547562ea58c.png)

## **Section-03: AWS VPC Resources Creation**

*Subdirectory for Lab Section*

![](media/08bce6c4b57d387ceefc617fd8478dad.png)

*Change Directory into Section Sub-Directory Containing Terraform Manifest Location*

| cd lab-06-meta-arguments-depends-on/section-03-depends-on-example/ |
|--------------------------------------------------------------------|

*Source code overview*

-   Within this section we will create a number of AWS network/VPC (Virtual Private Cloud) resources
-   These exercises will provide considerably more experience in Terraform resource creation and specific resource types within AWS

| *Terraform Resource Documentation* For your reference while reviewing the code in this lab and for future needs - the Terraform AWS Provider documentation for each resource type are provided below VPC <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc>  Subnet <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet> Internet Gateway <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway> Route Table <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table> Route in Route Table for Internet Access <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route> Associate Route Table with Subnet <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet> Create Security Group with in the VPC allowing ports 80 and 22 inbound <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group> Create EC2 Instance in VPC with a static key pair and with association of Security Group created prior <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance> |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

*Overview of Terraform Manifest*

| Open the following file in your local code editor for this section:  aws-vpc-resources.tf  Edit the code as necessary for your own Student Pod as instructed in the commented section of the manifest that begins with - “\#\#\#Note regarding lab usage”. Visual highlights are provided in the depictions below for further clarification of the location of necessary per pod edits. |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| For the purpose of breaking down the Terraform Resource blocks within this manifest the following are provided: In this section an uncommented view of the entire manifest (Terraform block, Providers block, all Resource blocks) are provided to allow review of how the blocks are structured and correlated In the subsequent sections per Resource code blocks are provided with significant commenting to deep dive into the intent, purpose, and syntax of each resource |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

![](media/d394886eae605b4ccd22fe9be3d660e3.png)

![](media/dbbe073c38dde2ca5f1371aa4838a707.png)

![](media/996e9ae6715f8c942015b918408a5a18.png)

*Manifest Per Resource Review*

| Note - no action is necessary by the student in this section but rather this serves as a very granular break down of to be created Terraform resources  The code block comments/breakdowns are also found in the GitHub repo for this lab and within the “commented” directory |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

-   AWS VPC (Virtual Private Cloud) Resource

*![](media/b80645bdad89395e64076599b51ebd62.png)*

-   AWS Subnet Resource

![](media/8177e6b9aa13c099c587bf4f8f086916.png)

-   AWS Internet Gateway

![](media/ebca7a6cca5ea2c1b2755f638c291f23.png)

-   AWS Route Table

![](media/3675206e5823bd4191f4ea7e82436a7f.png)

-   Route Table Entry

![](media/a545a164e1228df2eef03b28ccf12e46.png)

-   Route Table to Subnet ID Association

![](media/182ca2f046609adf1d370cb0007b68ee.png)

-   Security Group Creations to Allow Authorized Ingress/Egress Traffic Flows

![](media/ba8d48c8b9e6a83acd51d4d4462e6152.png)

| *Note on Completion of this Section and Entry Into Next Section*  We will not execute a Terraform workflow at this juncture In other words - the Terraform init, validate, plan, and apply commands will not be executed in this section Rather - we will build additional Terraform manifests for the full build and then will execute the Terraform workflow when all manifests have been created This is a bit of a departure from our prior lab patterns in which all resources were contained within a single manifest. This architecture is our first exposure to building Terraform manifests in a modular manner and we will explore deeper Terraform module use in a dedicated section subsequently. In short and for our current understanding - all Terraform files (.tf files) - that exist in a directory inherently have access to Resources and Variables within other files in that same directory. Such as: Resource exists in a file named “ex1.tf” in directory named “mydir” Resource which exists in a file named “ex2.tf” in the same directory of “mydir” can refer to and access the Resource in file “ex1.tf” |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## **Section-04: AWS EC2 Resource Creation**

*Subdirectory for Lab Section*

![](media/08bce6c4b57d387ceefc617fd8478dad.png)

*Source code overview*

-   Within this section we will create an EC2 compute Terraform Resource
-   The Resource will reference a number of Resources created in the VPC manifest of this lab including: subnet ID and Security Group ID.
-   A previously unexplored user_data block will be utilized in this manifest to install a simple Apache web server and which will serve as an additional validation point of ingress traffic and related VPC resources.

*Overview of Terraform Manifest*

| Open the following file in your local code editor for this section:  aws-ec2-resource.tf  Edit the code as necessary for your own Student Pod as instructed in the commented section of the manifest that begins with - “\#\#\#Note regarding lab usage”. Visual highlights are provided in the depictions below for further clarification of the location of necessary per pod edits. |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| For the purpose of breaking down the Terraform Resource blocks within this manifest the following are provided: In this section an uncommented view of the entire manifest (Terraform block, Providers block, all Resource blocks) are provided to allow review of how the blocks are structured and correlated In the subsequent sections per Resource code blocks are provided with significant commenting to deep dive into the intent, purpose, and syntax of each resource |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

![](media/c828f6803e6eb3a793d20ce0fe802fa6.png)

*Manifest Per Section Review*

| Note - no action is necessary by the student in this section but rather this serves as a very granular break down of to be created Terraform resources  The code block comments/breakdowns are also found in the GitHub repo for this lab and within the “commented” directory |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

*AWS EC2 Resource*

![](media/6200eb8ca47f9b6ad4e19f62cf220a86.png)

*User Data Section For Operating System Updates and Apache Web Server Install*

![](media/04717ecdb5c8a8b61d69795551675cbe.png)

| *Note on Completion of this Section and Entry Into Next Section*  We will not execute a Terraform workflow at this juncture In other words - the Terraform init, validate, plan, and apply commands will not be executed in this section Rather - we will build additional Terraform manifests for the full build and then will execute the Terraform workflow when all manifests have been created |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

## **Section-05: AWS Elastic IP Resource Creation With Meta-Argument Depends_On**

*Overview*

| Per AWS provided documentation segment below - extracted from the Elastic IP (EIP) address Resource section of the AWS Provider documentation - an ElP may fail to create and associate properly if the Internet Gateway of which it is dependent on does not exist prior.  In such circumstances and as will demonstrated in this example - we cannot simply refer to another dependency within the manifest - but must use the depends_on Meta-Argument option to ensure that the resource (EIP in this example) will not attempt to create until the dependency (IGW in this case) is fully created prior.  Note that there are many resource dependencies that are built into Terraform logic and do not require the depends_on explicit declaration. Example - there are many VPC constructs created in this lab that depend on the base VPC being created prior - such as Route Tables and Subnets. Based on built in dependencies and Terraform logic these entities will be scheduled for creation following the VPC creation itself. It is only when such dependencies are not in default Terraform logic and needs arise to orchestrate creation ordering that we must utilize the depends_on Meta-Argument. |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| ![](media/0d04c07c812886944a5f06c153600119.png) |
|-------------------------------------------------|

*Subdirectory for Lab Section*

![](media/08bce6c4b57d387ceefc617fd8478dad.png)

*Source code overview*

-   Within this section we will create an Elastic IP (EIP) Terraform Resource
-   The Resource will reference a number of Resources created in the VPC manifest of this lab including: EC2 instance ID and Internet Gateway ID
-   We will additionally introduce the usage of the depends_on Meta-Argument

*Overview of Terraform Manifest*

| Open the following file in your local code editor for this section:  aws-eip-with-depends-on.tf  Edit the code as necessary for your own Student Pod as instructed in the commented section of the manifest that begins with - “\#\#\#Note regarding lab usage”. Visual highlights are provided in the depictions below for further clarification of the location of necessary per pod edits. |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| For the purpose of breaking down the Terraform Resource blocks within this manifest the following are provided: In this section an uncommented view of the entire manifest (Terraform block, Providers block, all Resource blocks) are provided to allow review of how the blocks are structured and correlated In the subsequent sections per Resource code blocks are provided with significant commenting to deep dive into the intent, purpose, and syntax of each resource |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

![](media/3c73c8c9c2c45ff285aa8dbf0c29466e.png)

*Manifest Per Section Review*

| Note - no action is necessary by the student in this section but rather this serves as a very granular break down of to be created Terraform resources  The code block comments/breakdowns are also found in the GitHub repo for this lab and within the “commented” directory |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

*AWS Elastic IP Address Resource with Depends_On*

![](media/4b4252fc29ae0e5ab561f6b0e2dc5f9b.png)

*Workflow Command Execution*

-   Execute the following commands to initialize, validate, display plan, and eventually create the resources of the Terraform manifest
-   Expected outcome accompanies/follows each command set
-   The commands in this workflow are executed against all of the Terraform files (\*.tf files) that exist in the directory the commands are initiated within

| terraform init |
|----------------|

![](media/ef02b6be8e6b17bced1467adb6140977.png)

| terraform validate |
|--------------------|

![](media/9a44beb4d296a363c65c48b8ca3aaff3.png)

| terraform fmt |
|---------------|

-   No output is returned from the Terraform format command - indicating no spacing/alignment adjustments were necessary across the three manifests in the current working directory - which is rather typical when developing within a code editor that adjusts formatting in real time.

![](media/e23c77777f9046b03697174374d77677.png)

| terraform plan |
|----------------|

-   Output truncated as the plan output is a rather lengthy list of resources and associated attributes across the three manifest files and nine total resources specified.
-   Top portion of the plan output and the trailing output displaying 9 resources to be added depicted below and is the expected plan result.

![](media/47d28b177676d1dafcad58d887c9f4af.png)

![](media/32a779cce6b7f5fece9df62daf79da88.png)

| terraform apply -auto-approve |
|-------------------------------|

-   Truncated output displaying resultant only
-   Note that the creation of the entire list of nine resources may take a 1-2 minutes to complete

![](media/c92340819ce819a57d901a13fdd43360.png)

-   Following the successful creation of the full stack of manifest declared resources - we will move into the next lab section in which we will validate resource creations and ability to reach the EC2 resources as expected via SSH and HTTP

## **Section-06: Resource Creation and Access Validations**

*Overview*

-   The steps that follow in this section will ensure that the resources specified in our Terraform manifest of this lab were created successfully and are behaving as expected

*VPC Confirmation*

-   Within the AWS Console \> type “VPC” from the console’s search box \> and select the first search result (“VPC”) as depicted below

![](media/5b775d236869b556237b8c97703d76ae.png)

-   Select “VPCs” from the VPC Console page as depicted below

![](media/dc929a52527fd5467cbfce9441694ee1.png)

-   First ensure that the us-east-1 region (also known as N.Virginia) is the selected region of the console as depicted in STEP1 below
-   Isolate the VPC created in your lab instance typing the name of the VPC (I.e.vpc-dev-\<pod-number\>) into the VPC console search box and then select the returned search result as depicted below

![](media/5176d3bc6ab8903a97d6bb7105137540.png)

-   The existence of the VPC specific instance validates the Terraform resource creation was successful in AWS Region “us-east-1”
-   With the VPC selected we also have validation that the VPC was created with the correct/specified CIDR block (10.0.0.0/16) as depicted below

![](media/180bc74dcc11f855717340819b5cfbe7.png)

*Subnet Confirmation*

-   For validation of the subnet specified in the Terraform manifest - select Subnets from within the VPC Management Console (which should be current location from the prior step) as depicted in Step 1 below
-   From the Subnets console \> enter the name of your VPC (I.e. vpc-dev-\<pod-number\>) in “Filter subnets” box as depicted by Step 2 below and press enter
-   With the Subnet of your VPC selected \> confirm that the Subnet was created with the CIDR block specified in the manifest (10.0.1.0/24) as depicted by Step 3 below

![](media/a05b303acf445c53f434ad91e73fd20c.png)

*Route Table, Specific Route Table Entry, & Internet Gateway Confirmations*

-   Still within the VPC Management Console \> select Route Tables as depicted by Step 1 below
-   Type your VPC name (I.e. vpc-dev-\<pod-number\>) into the “Filter route tables” box as depicted by Step 2 below and press enter
-   There are likely two Route Tables currently associated with your VPC - the default Route Table automatically invoked during VPC creation (which is classified as the Main route table) and the Route Table we specified in the Terraform manifest. Select the non-main/custom created Route Table as depicted by Step 3 below
-   With the targeted Route Table selected \> open the Routes tab as depicted by Step 4 below
-   Note the appearance of the default route (0.0.0.0/0) specified in the Terraform manifest and that it points to the manifest provoked IGW (Internet Gateway) which was additionally provoked by the manifest as depicted by Step 5 below

![](media/4777dd32beb85ba81f2479da68815a98.png)

*Security Group Validation*

-   Still within the VPC Management Console \> select Security Groups as depicted by Step 1 below
-   Within the “Filter security groups” box type “Security group name” as depicted by Step 2 below
-   Select the search result of “Security group name” as depicted by Step 3 below

![](media/5e450bd7424f06632e454cc0d2a880e8.png)

-   Type the name of the Security Group (I.e. dev-vpc-default-sg-\<pod-number\>) as a postpend to the text in the search box as depicted by Step 4 below and press enter
-   Select the search result as depicted by Step 5 below

![](media/d507ebf69bab0fc223b8677f250a6647.png)

-   With the isolated Security Group selected \> open the “Inbound rules” tab \> and confirm that inbound rules allowing all source addresses access to SSH (port 22) and HTTP (port 80) as specified in the Terraform manifest

![](media/973c03713d596dd3272f4017b8aace25.png)

*Confirm EC2 Instance Creation*

-   Within the AWS Console \> type “EC2” from the console’s search box \> and select the first search result (“EC2”) as depicted below

![](media/26cd9f99220101270bd97d8b40751d97.png)

-   Select “Instances (running)” from the EC2 Console page as depicted below

![](media/a5b3eef30a0bf0d0b9740a5fdf2cdecf.png)

-   Within the Terraform manifest we assigned a Tag which may be used for ease of isolating our specific resource
-   Within the EC2 Console’s \> “Filter instances” search box \> type the Name tag defined within the manifest (I.e. myec2vm-\<pod-number\>) and press enter as depicted below
-   With the isolated EC2 instance selected \> use the Copy icon to the left of “Public IPv4 address” as depicted below \> we will use the captured value of this address to confirm that it is associated with the created Elastic IP Address in the subsequent step

![](media/552986d9efab99f543decfa4f947f515.png)

*Confirm Elastic IP Address (EIP) Creation*

-   From within the EC2 Console \> select Elastic IPs as depicted by Step 1 below
-   Paste the public IP address captured in the prior step into the “Filter Elastic IP address” box as depicted by Step 2 below
-   Select the “Allocated IPv4 address” search results as depicted by Step 3 below

![](media/449e3107cad4481bf56be543e4fc053f.png)

-   From the resultant screen \> select the “Associated instance ID” hyperlink as depicted below.
-   Selection of this link will navigate to the instance that this EIP is currently associated with

![](media/bf01496bc3d3f2c20133434bb1b0463d.png)

-   From the resultant screen and as depicted below \> we have validated that the EIP was created successfully and it is currently associated with the EC2 instance of the Terraform manifest (I.e. myec2vm-\<pod-number\>)

![](media/da9a334bfcd0a2fcb63f494b2905b34a.png)

*Validation of Security Group Rules and EC2 Instance Access - HTTP*

-   Our next validation will be of Security Group association with the EC2 instance and that associated ingress rules are functioning properly
-   If not already captured - copy the public IP address from either the Elastic IP Address or EC2 instance page
-   Reviewing the capture from the Elastic IP Address page - click on the Copy icon to the left of the “Associated IPv4 address as depicted below.

![](media/0c5611ed3c0d718c79ec780b1090c4ff.png)

-   Open a web browser and paste the EC2 instance/public IP address captured into the browser’s address bar as depicted below
-   Receipt of the “Welcome to OneCloud …. “ text in the browser validates:
    -   The Security Group was assigned to the EC2 instance properly and is allowing port 80 traffic from all source addresses
    -   The User Data section of the EC2 Resource manifest created the Apache web server and created a simple landing page properly

![](media/83bf01b961485940d1ec9b7e5acf6ad9.png)

*Validation of Security Groups and EC2 Instance Access - SSH*

-   Within the AWS Console \> type “EC2” from the console’s search box \> and select the first search result (“EC2”) as depicted below

![](media/26cd9f99220101270bd97d8b40751d97.png)

-   Select “Instances (running)” from the EC2 Console page as depicted below

![](media/a5b3eef30a0bf0d0b9740a5fdf2cdecf.png)

*Destroy Terraform Resources*

-   With the validations now complete of Terraform Resource creation, ordering provoked by the depends_on Mega-Argument, and access to the compute instance - we will proceed in removing all associated resources from AWS
-   Ensure that your terminal is within the lab6 directory and this section's sub-directory prior to issuing the destroy command

| terraform destroy -auto-approve |
|---------------------------------|

-   Output truncated to only display command invoke and completion segments

![](media/d4707d8164a437bee22e37100d80445e.png)

# Lab7 - **Resource Meta-Argument - Count**

## **Section-01: Lab Overview**

Within this lab we will explore the Terraform Meta-Argument Count feature allowing:

-   Utilization of the Meta-Argument Count option to elicit the creation of many identical EC2 compute instances within a single Terraform execution
-   A practical example of implementing Count and Count Index

*GitHub Directory Code Location and Guidance*

-   The Github root directory for this lab and corresponding sub-directories are depicted below.
-   Use your own local copy of the repository for code execution and any code edits necessary.

![](media/9635855a252276b051f36fc8bb0f53e0.png)

## **Section-02: Create Multiple AWS EC2 Instances using Meta-Argument Count**

*Subdirectory for Lab Section*

![](media/fb79e73f9c60376a3d3aca27ff7dd9cd.png)

*Change Directory into Section Sub-Directory Containing Terraform Manifest Location*

| cd lab-07-meta-arguments-counts/section-02-count-with-single-tag-name/ |
|------------------------------------------------------------------------|

*Source code overview*

-   Within this source code we will create five (5) EC2 using a single manifest Resource block via the utilization of the Count argument

*Overview of Terraform Manifest*

| Open the following file in your local code editor for this section:  aws-ec2-resource.tf  Edit the code as necessary for your own Student Pod as instructed in the commented section of the manifest that begins with - “\#\#\#Note regarding lab usage”. Visual highlights are provided in the depictions below for further clarification of the location of necessary per pod edits. |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| For the purpose of breaking down the Terraform Resource blocks within this manifest the following are provided: In this section an uncommented view of the entire manifest (Terraform block, Providers block, all Resource blocks) are provided to allow review of how the blocks are structured and correlated In the subsequent sections per Resource code blocks are provided with significant commenting to deep dive into the intent, purpose, and syntax of each resource |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

![](media/ffa639b88b1770bbeaf433a4367c7ee3.png)

*Manifest Per Resource Review*

| Note - no action is necessary by the student in this section but rather this serves as a very granular break down of to be created Terraform resources  The code block comments/breakdowns are also found in the GitHub repo for this lab and within the “commented” directory |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

-   AWS EC2 Compute Resource

*![](media/db63d2a48d0fefd49fb7e5583617c2ce.png)*

*Workflow Command Execution*

-   Execute the following commands to initialize, validate, display plan, and eventually create the resources of the Terraform manifest
-   Expected outcome accompanies/follows each command set

| terraform init |
|----------------|

| terraform validate |
|--------------------|

![](media/f0f9eb87ca20a5e32584225cb62674bc.png)

| terraform fmt |
|---------------|

-   No output is returned from the Terraform format command - indicating no spacing/alignment adjustments were necessary across the three manifests in the current working directory - which is rather typical when developing within a code editor that adjusts formatting in real time.

![](media/b1a3b64eb9bde80a46b55dcb1dc48cc9.png)

| terraform plan |
|----------------|

-   Output truncated as the plan output is a rather lengthy list of resources and associated attributes across the five total resources to be created.
-   Note that while only a single manifest Resource block was declared - plan indicates 5 resources are to be added. Thus validating the intended impact of the Count argument.
-   Additionally the middle output snippet displays an example of one of the five EC2 instances to be created and the specific instance displayed is at index 2 (denoted as instance-name[index-number].

![](media/4c0a2136cd5fa4427f264c894fc36350.png)

![](media/57dfda996ed0b7cc2f8613db9d5c89ce.png)

![](media/6744af3eaa96d65ffa47605c76c43444.png)

| terraform apply -auto-approve |
|-------------------------------|

-   Truncated output displaying resultant only
-   Note that the creation of the entire list of five resources may take a 1-2 minutes to complete

![](media/00d62ab32371fbe0970dfd1028a0b6e6.png)

*Confirm Resource Creation from AWS Console*

-   Within the AWS Console \> type “EC2” from the console’s search box \> and select the first search result (“EC2”) as depicted below

![](media/26cd9f99220101270bd97d8b40751d97.png)

-   Select “Instances (running)” from the EC2 Console page as depicted below

![](media/a5b3eef30a0bf0d0b9740a5fdf2cdecf.png)

-   Within the Terraform manifest we assigned a Tag which may be used for ease of isolating our specific resource
-   Within the EC2 Console’s \> “Filter instances” search box \> type the Name tag defined within the manifest (I.e.ec2-web-instance-\<pod-number\>) and then select the returned search result as depicted below

![](media/8ee7ee26ab5af6f803eb05b2273d5cb3.png)

-   We now have confirmation of the following as depicted below:
    -   The five EC2 instance were created successfully and are in a running state matching the desired state in Terraform manifest
    -   The Meta_Argument Count variable behaved as expected and desired - creating a number of identical instances using a single Resource block in the manifest

![](media/0af04628f0b5501238e0cacbbbd8281c.png)

*Destroy Terraform Resources*

-   With the validations now complete of Terraform Resource creation duplication via the Count argument we will proceed in removing all associated resources from AWS
-   Ensure that your terminal is within the lab7 directory and this section's sub-directory prior to issuing the destroy command

| terraform destroy -auto-approve |
|---------------------------------|

-   Output truncated to only display command invoke and completion segments
-   Note it may take a few minutes to complete the destruction of all five instances as seen in the depiction

![](media/3774a9d2c74108709b5e0c08f395b009.png)

![Text Description automatically generated](media/dbd33a716f0d566348c4bc4697b30c3c.png)

## **Section-03: Create Multiple AWS EC2 Instances using Meta-Argument Count with Indexed Tag Names**

*Subdirectory for Lab Section*

![Graphical user interface, text, application Description automatically generated](media/990402ee13ec8185aa52c0fe5b0d67a4.png)

*Change Directory into Section Sub-Directory Containing Terraform Manifest Location*

| cd lab-07-meta-arguments-counts/section-03-count-with-indexed-tag-name/ |
|-------------------------------------------------------------------------|

*Source code overview*

-   Within this source code we will create five (5) EC2 using a single manifest Resource block via the utilization of the Count argument
-   This section will be identical to Section-02 of this lab but in this invoke we will utilize the Count’s index to uniquely tag each EC2 instance
-   Note that while this lab uses the Count’s index for the tag name - the index may be used within other segments/purposes of the manifest as necessary

*Overview of Terraform Manifest*

| Open the following file in your local code editor for this section:  aws-ec2-resource.tf  Edit the code as necessary for your own Student Pod as instructed in the commented section of the manifest that begins with - “\#\#\#Note regarding lab usage”. Visual highlights are provided in the depictions below for further clarification of the location of necessary per pod edits. |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| For the purpose of breaking down the Terraform Resource blocks within this manifest the following are provided: In this section an uncommented view of the entire manifest (Terraform block, Providers block, all Resource blocks) are provided to allow review of how the blocks are structured and correlated In the subsequent sections per Resource code blocks are provided with significant commenting to deep dive into the intent, purpose, and syntax of each resource |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

![Text Description automatically generated](media/e8c2bb39afe969b70c07d9dc4e9478aa.png)

*Manifest Per Resource Review*

| Note - no action is necessary by the student in this section but rather this serves as a very granular break down of to be created Terraform resources  The code block comments/breakdowns are also found in the GitHub repo for this lab and within the “commented” directory |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

-   AWS EC2 Compute Resource

*![](media/5a7e941b0e50d928e08394b62574e94e.png)*

*Workflow Command Execution*

-   Execute the following commands to initialize, validate, display plan, and eventually create the resources of the Terraform manifest
-   Expected outcome accompanies/follows each command set

| terraform init |
|----------------|

| terraform validate |
|--------------------|

![](media/f789f25ef5c607efddac02d3785cbc01.png)

| terraform fmt |
|---------------|

-   No output is returned from the Terraform format command - indicating no spacing/alignment adjustments were necessary across the three manifests in the current working directory - which is rather typical when developing within a code editor that adjusts formatting in real time.

![](media/cb216e420d8c46efe23f8a61129309d2.png)

| terraform plan |
|----------------|

-   Output truncated as the plan output is a rather lengthy list of resources and associated attributes across five resources
-   Note that while only a single manifest Resource block was declared - plan indicates 5 resources are to be added. Thus validating the intended impact of the Count argument.
-   Additionally the snippet displays an example of one of the five EC2 instances to be created and the specific instance displayed is at index 0.

![Text Description automatically generated with medium confidence](media/e6d6a6437cd6395c439d7ca63b06e19b.png)

![](media/3add3668db51d5395f5e9c2666c3c8a0.png)

| terraform apply -auto-approve |
|-------------------------------|

-   Truncated output displaying resultant only
-   Note that the creation of the entire list of nine resources may take a 1-2 minutes to complete

![Text Description automatically generated](media/f77a6bc70e14ffbc799fe97ce2d82118.png)

*Confirm Resource Creation from AWS Console*

-   Within the AWS Console \> type “EC2” from the console’s search box \> and select the first search result (“EC2”) as depicted below

![Graphical user interface, text Description automatically generated](media/26cd9f99220101270bd97d8b40751d97.png)

-   Select “Instances (running)” from the EC2 Console page as depicted below

![](media/a5b3eef30a0bf0d0b9740a5fdf2cdecf.png)

-   Within the Terraform manifest we assigned a Tag which may be used for ease of isolating our specific resource
-   Within the EC2 Console’s \> “Filter instances” search box \> type the Name tag defined within the manifest (I.e.ec2-web-instance-\<pod-number\>) and then select first result in the returned list as depicted below

![Graphical user interface, application, table Description automatically generated](media/8ee7ee26ab5af6f803eb05b2273d5cb3.png)

-   We now have confirmation of the following as depicted below:
    -   The five EC2 instance were created successfully and are in a running state matching the desired state in Terraform manifest
    -   The Meta_Argument Count variable behaved as expected and desired - creating a number of identical instances using a single Resource block in the manifest
    -   The count.index variable successfully labeled each resource uniquely with the tag Name

![Graphical user interface, application, table Description automatically generated](media/673b5a8b9a85234eb651aa61bd19db18.png)

*Destroy Terraform Resources*

-   With the validations now complete of Terraform Resource creation duplication via the Count argument and the use of the count.index variable with resource tagging - we will proceed in removing all associated resources from AWS
-   Ensure that your terminal is within the lab7 directory and this section's sub-directory prior to issuing the destroy command

| terraform destroy -auto-approve |
|---------------------------------|

-   Output truncated to only display command invoke and completion segments

![Text Description automatically generated](media/b64008854e756f0fd69f46e676fe3a32.png)

# Lab8 - **Resource Meta-Argument - For_Each**

## **Section-01: Lab Overview**

Within this lab we will explore the Terraform Meta-Argument For_Each feature allowing:

-   Creation of a number of resources based on either a supplied map or string set
-   A defined map utilized within a for_each iteration would be made up key-value pairs such as:

![Text Description automatically generated](media/e09c84f3fc666e09143ad7ea22ff5840.png)

-   Alternatively a simple string set utilized within a for_each iteration would be made up of an array of strings such as:

![](media/f6537eac4c4b9b789a9d3caa468bd968.png)

-   The map and string set examples provided will be provoked within our manifest of this lab to demonstrate their unique use cases and the greater power of for_each loops in resource creation

*GitHub Directory Code Location and Guidance*

-   The Github root directory for this lab and corresponding sub-directories are depicted below.
-   Use your own local copy of the repository for code execution and any code edits necessary.

![Graphical user interface, text Description automatically generated with medium confidence](media/0b990a8291361b7c7f0676ec5cb5b462.png)

## **Section-02: Create Multiple AWS S3 Buckets using Meta-Argument For_Each with Maps**

*Subdirectory for Lab Section*

![Graphical user interface, text, application Description automatically generated](media/e70ab8b13b259eea156d13bd00555737.png)

*Change Directory into Section Sub-Directory Containing Terraform Manifest Location*

| cd lab-08-meta-arguments-for-each/section-02-for-each-with-map/ |
|-----------------------------------------------------------------|

*Source code overview*

-   Within this source code we will create four (4) AWS S3 storage buckets via a for_each loop
-   The for_each loop will obtain it’s bucket name and tag attributes via a map

*Overview of Terraform Manifest*

| Open the following file in your local code editor for this section:  aws-s3-buckets.tf  Edit the code as necessary for your own Student Pod as instructed in the commented section of the manifest that begins with - “\#\#\#Note regarding lab usage”. Visual highlights are provided in the depictions below for further clarification of the location of necessary per pod edits. |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| For the purpose of breaking down the Terraform Resource blocks within this manifest the following are provided: In this section an uncommented view of the entire manifest (Terraform block, Providers block, all Resource blocks) are provided to allow review of how the blocks are structured and correlated In the subsequent sections per Resource code blocks are provided with significant commenting to deep dive into the intent, purpose, and syntax of each resource |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

![Shape Description automatically generated with medium confidence](media/a6e8e315ed79ad1258e0471ff1e7780f.png)

![Text Description automatically generated](media/c8dc4df5158f36684875239d1522f085.png)

*Manifest Per Resource Review*

| Note - no action is necessary by the student in this section but rather this serves as a very granular break down of to be created Terraform resources  The code block comments/breakdowns are also found in the GitHub repo for this lab and within the “commented” directory |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

-   AWS S3 Bucket Resource

![Text Description automatically generated](media/4b205cdd1c8c5e586e67eabb4e6aecab.png)

*Workflow Command Execution*

-   Execute the following commands to initialize, validate, display plan, and eventually create the resources of the Terraform manifest
-   Expected outcome accompanies/follows each command set

| terraform init |
|----------------|

| terraform validate |
|--------------------|

![](media/260f349600c14fad1e1be31d6d65293a.png)

| terraform fmt |
|---------------|

-   No output is returned from the Terraform format command - indicating no spacing/alignment adjustments were necessary across the three manifests in the current working directory - which is rather typical when developing within a code editor that adjusts formatting in real time.

![](media/52709a46c5875485eee25951ef632a7b.png)

| terraform plan |
|----------------|

-   Output truncated as the plan output is a rather lengthy list of resources and associated attributes across four resources to be created
-   Note that while only a single manifest Resource block was declared - plan indicates 4 resources are to be added. Thus validating the intended impact of the for_each argument.
-   Additionally the snippet displays an example of one of the four S3 instances to be created and the specific instance displayed is associated with the map key of “dev”
-   The output additionally displays the unique tag values that are generated via the map usage

![A picture containing text Description automatically generated](media/31e8e1dbe4adc539fb996762d9eb2026.png)

![](media/cc2fb8cc34de0bff3083382ce2a4168c.png)

| terraform apply -auto-approve |
|-------------------------------|

-   Truncated output displaying resultant only

![Text Description automatically generated](media/7a11952ca98e37f197f66764ea44f595.png)

*Confirm Resource Creation from AWS Console*

-   Within the AWS Console \> type “S3” from the console’s search box \> and select the first search result (“S3”) as depicted below

![Graphical user interface Description automatically generated](media/12a4fcab9f8e70ea8b4c3c3bd56549b8.png)

-   Within the S3 Console \> type “bucket-\<pod-number” into the box labeled “Find buckets by name” as depicted below \> press enter
-   The resultant list confirms that the four buckets declared in the for_each loop of the Terraform manifest were created successfully and one for each of the keys within the map

![Graphical user interface, application Description automatically generated](media/3d5778fb80a46cd01b1ef0c3c1206a0a.png)

-   Drill into the first search result by selecting the bucket’s name hyperlink as depicted below

![Graphical user interface Description automatically generated](media/1cb0d6c304c17139eaca553b4132c4b7.png)

-   Open the bucket’s Properties tab as depicted below.
-   Note in the Tags section the Keys and Values were configured with the manifest map specifications. As the for loop was iterated over - the specifications in the map for this iteration (dev) were populated into the Tags based on keys and values of that map entry.

![Graphical user interface, text, application, Teams Description automatically generated](media/4c6d46e360f994b176444441204d6f53.png)

*Destroy Terraform Resources*

-   With the validations now complete of Terraform S3 Resource creation via a map and iterating over the map’s key-value pairs via a Meta-Argument for_each loop - we will proceed in removing all associated resources from AWS
-   Ensure that your terminal is within the lab8 directory and this section's sub-directory prior to issuing the destroy command

| terraform destroy -auto-approve |
|---------------------------------|

-   Output truncated to only display command invoke and completion segments

![Graphical user interface, text Description automatically generated](media/608d1863c8171f63523d22fc17c6ded6.png)

![Text Description automatically generated](media/1a444e7a551f6b1917d8da660b5a06cf.png)

## **Section-03: Create Multiple AWS S3 Buckets using Meta-Argument For_Each with String Set**

*Subdirectory for Lab Section*

![](media/ef116fda40cccb393a2a885a06ba49a2.png)

*Change Directory into Section Sub-Directory Containing Terraform Manifest Location*

| cd lab-08-meta-arguments-for-each/section-03-for-each-with-string-set/ |
|------------------------------------------------------------------------|

*Source code overview*

-   Within this source code we will create three (3) EC2 compute instances via a Meta-Argument for_each loop
-   The for_each loop will obtain the EC2 Name tag via a string set

*Overview of Terraform Manifest*

| Open the following file in your local code editor for this section:  aws-ec2-resources.tf  Edit the code as necessary for your own Student Pod as instructed in the commented section of the manifest that begins with - “\#\#\#Note regarding lab usage”. Visual highlights are provided in the depictions below for further clarification of the location of necessary per pod edits. |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| For the purpose of breaking down the Terraform Resource blocks within this manifest the following are provided: In this section an uncommented view of the entire manifest (Terraform block, Providers block, all Resource blocks) are provided to allow review of how the blocks are structured and correlated In the subsequent sections per Resource code blocks are provided with significant commenting to deep dive into the intent, purpose, and syntax of each resource |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

![Text Description automatically generated](media/cab8aa275ce8925421e1445c87c8db21.png)

*Manifest Per Resource Review*

| Note - no action is necessary by the student in this section but rather this serves as a very granular break down of to be created Terraform resources  The code block comments/breakdowns are also found in the GitHub repo for this lab and within the “commented” directory |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

-   AWS EC2 Resource

![Text Description automatically generated](media/a05be747debdf77211f047c22394b1d2.png)

*Workflow Command Execution*

-   Execute the following commands to initialize, validate, display plan, and eventually create the resources of the Terraform manifest
-   Expected outcome accompanies/follows each command set

| terraform init |
|----------------|

| terraform validate |
|--------------------|

![](media/7b389412f7f84170fa8093d343f27f4b.png)

| terraform plan |
|----------------|

-   Output truncated as the plan output is a rather lengthy list of resources and associated attributes across three resources to be created
-   Note that while only a single manifest Resource block was declared - plan indicates 3 resources are to be added. Thus validating the intended impact of the for_each argument.
-   Additionally the snippet displays an example of one of the three EC2 instances to be created and the specific instance displayed is associated with the string set entry of “db”
-   The tags block of the output validates the tag Name - for the displayed instance - is properly referencing the string set as the for_each loop is iterated and is set to “ec2-instance-0-db”

![Text Description automatically generated](media/d3a41deb9126ee4a086abec05bb11ea1.png)

![](media/54be7f1daa6b0153aa427af67c130b8a.png)

| terraform apply -auto-approve |
|-------------------------------|

-   Truncated output displaying resultant only

![Text Description automatically generated](media/7b5272df29f3419d6153b0419fea2b55.png)

*Confirm Resource Creation from AWS Console*

-   Within the AWS Console \> type “EC2” from the console’s search box \> and select the first search result (“EC2”) as depicted below

![Graphical user interface, text Description automatically generated](media/26cd9f99220101270bd97d8b40751d97.png)

-   Select “Instances (running)” from the EC2 Console page as depicted below

![Graphical user interface Description automatically generated](media/a5b3eef30a0bf0d0b9740a5fdf2cdecf.png)

-   Within the EC2 Console’s \> “Filter instances” search box \> type the beginning of tag Name syntax defined within the manifest (I.e. ec2-instance-\<pod-number\>) \> press enter
-   In the search results note that three EC2 instances were created and were successfully assigned the string set names via for_each loop iteration

![Graphical user interface Description automatically generated](media/520c5564c76be486eb41c5734b3d7816.png)

*Destroy Terraform Resources*

-   With the validations now complete of Terraform Resource creation via a for_each loop over a string set - we will proceed in removing all associated resources from AWS
-   Ensure that your terminal is within the lab8 directory and this section's sub-directory prior to issuing the destroy command

| terraform destroy -auto-approve |
|---------------------------------|

-   Output truncated to only display command invoke and completion segments
-   Note that the destroy process may take a few minutes to complete
